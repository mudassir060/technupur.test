import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test/gen/assets.gen.dart';
import 'package:test/ui/views/home/home_viewmodel.dart';

class AppBarHomeView extends ViewModelWidget<HomeViewModel> {
  const AppBarHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 37,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Assets.icons.menu.image(),
          ),
          const Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Online',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Shop',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2),
              Text(
                'ECOMMERCE APPLICATION',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          Container(
            width: 37,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Assets.icons.search.image(),
          ),
        ],
      ),
    );
  }
}
