import 'dart:async';

import 'package:clean_architecture_with_bloc/domain/products/usecases/get_categories.dart';
import 'package:clean_architecture_with_bloc/presentation/products/bloc/category/catogory_event.dart';
import 'package:clean_architecture_with_bloc/presentation/products/bloc/category/catogory_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories getCategories;

  List _cache = []; // optional cache

  CategoryBloc(this.getCategories) : super(CategoryInitial()) {
    on<FetchCategoriesEvent>(_onFetchCategories);
    on<SelectCategoryEvent>(_onSelectCategory);
  }

  Future<void> _onFetchCategories(
    FetchCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    print("category reached");
    if (_cache.isNotEmpty) {
      emit(CategoryLoaded(categories: List.from(_cache)));
      return;
    }

    emit(CategoryLoading());

    try {
      final categories = await getCategories();
      _cache = categories;

      emit(CategoryLoaded(categories: categories, selectedCategory: ""));
    } catch (e) {
      emit(CategoryError("Failed to load categories"));
    }
  }

  void _onSelectCategory(
    SelectCategoryEvent event,
    Emitter<CategoryState> emit,
  ) {
    final current = state;
    if (current is CategoryLoaded) {
      emit(current.copyWith(selectedCategory: event.category));
    }
  }
}
