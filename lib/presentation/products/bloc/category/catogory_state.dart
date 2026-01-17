import 'package:clean_architecture_with_bloc/domain/products/entities/poduct_category_entity/category_entiry.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categories;
  final String? selectedCategory;

  CategoryLoaded({required this.categories, this.selectedCategory});

  CategoryLoaded copyWith({
    List<CategoryEntity>? categories,
    String? selectedCategory,
  }) {
    return CategoryLoaded(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory,
    );
  }
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}

class SelectCategory extends CategoryState {
  final String selectedCategory;

  SelectCategory(this.selectedCategory);
}
