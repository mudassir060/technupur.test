import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test/ui/common/ui_helpers.dart';
import 'package:test/ui/views/home/home_viewmodel.dart';

class ProductList extends ViewModelWidget<HomeViewModel> {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final product = viewModel.products[index];

          final bool hasDiscount = product.discountPercentage > 0;

          final double discountedPrice = hasDiscount
              ? product.price -
                  (product.price * product.discountPercentage / 100)
              : product.price;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(product.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "-${product.discountPercentage}%",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              verticalSpaceSmall,
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  horizontalSpaceSmall,
                  Text(
                    '\$${discountedPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              verticalSpaceSmall,
              if (product.status == false)
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: 110,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Sold Out",
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                )
            ],
          );
        },
      ),
    );
  }
}
