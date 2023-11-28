import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/base/base_view.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/core/coordinator/coordinator.dart';
import 'package:flutter_demo/core_ui/button/app_button.dart';
import 'package:flutter_demo/domain/_auth/auth_route.dart';
import 'package:flutter_demo/domain/_onboard/onboard_route.dart';
import 'package:flutter_demo/resources/app_asset.dart';
import 'package:flutter_demo/resources/app_color.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends BaseViewState<WelcomeView> {
  @override
  BaseViewModel viewModel() => BaseViewModel();

  @override
  ViewConfig viewConfig() =>
      ViewConfig(ignoreTopSafeArea: true, ignoreBottomSafeArea: true);

  @override
  Widget contentView(BuildContext context) {
    return _contentView();
  }

  Widget _contentView() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
          image: AppAsset.imgGetStarted,
          fit: BoxFit.fill,
        ),
        Container(
          color: AppColor.black.withOpacity(0.5),
        ),
        Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome to Fluxstore!",
                style: AppTextStyle.osR24.white,
              ),
              SizedBox(height: 12),
              Text(
                "The home for fashionista!",
                style: AppTextStyle.osR14.white,
              ),
              SizedBox(height: 60),
              AppButton(
                title: "Get Started",
                backgroundColor: AppColor.alphaWhite,
                borderColor: AppColor.white,
                onPressed: () => app.coordinator.replacePush(OnboardRoute.intro),
              ),
              SizedBox(height: size.height * 0.2),
            ],
          ),
        ),
      ],
    );
  }
}
