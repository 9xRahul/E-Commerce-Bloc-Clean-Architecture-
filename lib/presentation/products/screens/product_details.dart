import 'package:clean_architecture_with_bloc/domain/products/entities/product/product_entity.dart';
import 'package:clean_architecture_with_bloc/presentation/products/bloc/products/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductsBloc>().add(ProductImageChanged(0));
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image slider + buttons
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                final images = product.images?.isNotEmpty == true
                    ? product.images!
                    : [product.thumbnail];

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: images.length,
                        onPageChanged: (index) {
                          context.read<ProductsBloc>().add(
                            ProductImageChanged(index),
                          );
                        },
                        itemBuilder: (_, index) {
                          return Image.network(
                            images[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                      ),
                    ),

                    // Previous
                    Positioned(
                      left: 10,
                      child: state.imageIndex != 0
                          ? IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                              onPressed: state.imageIndex > 0
                                  ? () {
                                      final newIndex = state.imageIndex - 1;

                                      _pageController.animateToPage(
                                        newIndex,
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        curve: Curves.easeInOut,
                                      );

                                      context.read<ProductsBloc>().add(
                                        ProductImageChanged(newIndex),
                                      );
                                    }
                                  : null,
                            )
                          : SizedBox(),
                    ),

                    // Next
                    Positioned(
                      right: 10,

                      child: state.imageIndex < images.length - 1
                          ? IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                              onPressed: state.imageIndex < images.length - 1
                                  ? () {
                                      final newIndex = state.imageIndex + 1;

                                      _pageController.animateToPage(
                                        newIndex,
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        curve: Curves.easeInOut,
                                      );

                                      context.read<ProductsBloc>().add(
                                        ProductImageChanged(newIndex),
                                      );
                                    }
                                  : null,
                            )
                          : SizedBox(),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titlePriceSection(product),
                  _ratingStockSection(product),

                  _sectionTitle("Description"),
                  Text(product.description),

                  _sectionTitle("Product Details"),
                  _infoTile("Brand", product.brand),
                  _infoTile("Category", product.category),
                  _infoTile("SKU", product.sku),
                  _infoTile("Weight", "${product.weight ?? '-'} g"),
                  _infoTile(
                    "Minimum Order",
                    product.minimumOrderQuantity?.toString(),
                  ),

                  if (product.dimensions != null)
                    _infoTile(
                      "Dimensions",
                      "${product.dimensions!.width} x ${product.dimensions!.height} x ${product.dimensions!.depth}",
                    ),

                  _infoTile("Warranty", product.warrantyInformation),
                  _infoTile("Shipping", product.shippingInformation),
                  _infoTile("Return Policy", product.returnPolicy),
                  _infoTile("Availability", product.availabilityStatus),

                  if (product.meta != null) ...[
                    _sectionTitle("Meta"),
                    _infoTile("Barcode", product.meta!.barcode),
                    _infoTile("QR Code", product.meta!.qrCode),
                  ],

                  if (product.tags?.isNotEmpty == true) ...[
                    _sectionTitle("Tags"),
                    Wrap(
                      spacing: 6,
                      children: product.tags!
                          .map((e) => Chip(label: Text(e)))
                          .toList(),
                    ),
                  ],

                  if (product.reviews?.isNotEmpty == true) ...[
                    _sectionTitle("Reviews"),
                    ...product.reviews!.take(3).map(_reviewTile),
                  ],

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titlePriceSection(ProductEntity product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              "₹ ${product.price}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 10),
            if (product.discountPercentage != null)
              Text(
                "${product.discountPercentage}% OFF",
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ],
    );
  }

  Widget _ratingStockSection(ProductEntity product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 18),
          const SizedBox(width: 4),
          Text(product.rating.toString()),
          const SizedBox(width: 12),
          Text("Stock: ${product.stock}"),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _infoTile(String title, String? value) {
    if (value == null || value.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _reviewTile(review) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review.reviewerName ?? "User",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, size: 14, color: Colors.amber),
                const SizedBox(width: 4),
                Text(review.rating.toString()),
              ],
            ),
            const SizedBox(height: 4),
            Text(review.comment ?? ""),
          ],
        ),
      ),
    );
  }
}
