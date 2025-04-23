import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test/ui/common/app_colors.dart';
import 'package:test/ui/common/ui_helpers.dart';
import 'package:test/ui/views/home/widgets/app_bar.dart';
import 'package:test/ui/views/home/widgets/main_category_bar.dart';
import 'package:test/ui/views/home/widgets/product_list.dart';
import 'package:test/ui/views/home/widgets/shipping_card.dart';
import 'package:test/ui/views/home/widgets/sub_category_bar.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return const Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                AppBarHomeView(),
                verticalSpaceSmall,
                MainCategoryBar(),
                verticalSpaceSmall,
                SubCategoryBar(),
                verticalSpaceSmall,
                ProductList(),
                verticalSpaceSmall,
                ShippingCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
