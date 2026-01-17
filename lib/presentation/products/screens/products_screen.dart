import 'package:clean_architecture_with_bloc/core/utils/snack_bar.dart';
import 'package:clean_architecture_with_bloc/presentation/products/bloc/category/catogory_bloc.dart';
import 'package:clean_architecture_with_bloc/presentation/products/bloc/category/catogory_event.dart';
import 'package:clean_architecture_with_bloc/presentation/products/bloc/category/catogory_state.dart';

import 'package:clean_architecture_with_bloc/presentation/products/bloc/products/products_bloc.dart';
import 'package:clean_architecture_with_bloc/presentation/products/screens/widgets/catogory_list_item.dart';
import 'package:clean_architecture_with_bloc/presentation/products/screens/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ProductsBloc>().add(FetchProducts(category: ""));
    context.read<CategoryBloc>().add(FetchCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("All Poducts")),
        body: Column(
          children: [
            SizedBox(
              height: 55,
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CategoryLoaded) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemCount: state.categories.length + 1,
                      itemBuilder: (context, index) {
                       
                        if (index == 0) {
                          final isSelected = state.selectedCategory == "";

                          return CategoryChip(
                            name: "All",
                            isSelected: isSelected,
                            onTap: () {
                              context.read<CategoryBloc>().add(
                                SelectCategoryEvent(""),
                              );
                              print(
                                "Selected category = ${state.selectedCategory}",
                              );

                              context.read<ProductsBloc>().add(
                                FetchProducts(category: "all"),
                              );
                            },
                          );
                        }

                        final category = state.categories[index - 1];
                        final isSelected =
                            state.selectedCategory == category.name;

                        return CategoryChip(
                          name: category.name,
                          isSelected: isSelected,
                          onTap: () {
                            context.read<CategoryBloc>().add(
                              SelectCategoryEvent(category.name),
                            );

                            context.read<ProductsBloc>().add(
                              FetchProducts(category: category.name),
                            );
                          },
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),

            Expanded(
              child: BlocConsumer<ProductsBloc, ProductsState>(
                listener: (context, state) {
                  print("loading.........");
                  if (state is ProductLoadingError) {
                    showSnackBar(context, "Error in loading the products");
                  }
                },
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProductsLoadSuccess) {
                    final products = state.products;

                    return GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 columns
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.68, // controls card height
                          ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return ProductGridCard(product: product);
                      },
                    );
                  } else {
                    return Center(child: Text("Failed to load products"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
