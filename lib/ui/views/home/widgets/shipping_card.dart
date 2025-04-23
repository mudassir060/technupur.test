import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test/gen/assets.gen.dart';
import 'package:test/ui/views/home/home_viewmodel.dart';

class ShippingCard extends ViewModelWidget<HomeViewModel> {
  const ShippingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF17A2B8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 57,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Assets.images.deliveryMan.image(),
          ),
          const Column(
            children: [
              Text(
                'Free Shipping Over \$0',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Free returns and exchange',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Assets.images.call.image(width: 47)
        ],
      ),
    );
  }
}
