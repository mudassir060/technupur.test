import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:test/gen/assets.gen.dart';
import 'package:test/ui/common/app_colors.dart';
import 'package:test/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            verticalSpaceMassive,
            Assets.images.splashLogo.image(
              width: 250,
              height: 250,
            ),
            Assets.images.poweredByTechnupur.image(
              width: 200,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
