import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/base/base_view.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/core/coordinator/coordinator.dart';
import 'package:flutter_demo/core/rx/controllers/button_controller.dart';
import 'package:flutter_demo/core_ui/button/app_button.dart';
import 'package:flutter_demo/core_ui/page_control/page_control_view.dart';
import 'package:flutter_demo/domain/_auth/auth_route.dart';
import 'package:flutter_demo/domain/objects/intro_data.dart';
import 'package:flutter_demo/features/onboard/intro/intro_view_model.dart';
import 'package:flutter_demo/resources/app_asset.dart';
import 'package:flutter_demo/resources/app_color.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends BaseViewState<IntroView> {
  final _viewModel = IntroViewModel();
  final _shoppingNowButtonController = ButtonController();
  late IntroOutput _output;

  var _currentPage = 0;
  final _leftRightPadding = 58;
  final _interItemSpacing = 32;
  late PageController _pageController;
  final data = IntroData.values;

  @override
  BaseViewModel viewModel() => _viewModel;

  @override
  SafeAreaConfig safeAreaConfig() =>
      SafeAreaConfig(enableTopSafeArea: false, enableBottomSafeArea: false);

  @override
  void prepareInput() {
    final input = IntroInput(onTapShoppingNow: _shoppingNowButtonController.onTap);
    _output = _viewModel.transform(input);
  }

  @override
  void observeOutput() {
    _output.navigateNext.listen((value) {
      app.coordinator.push(AuthRoute.register);
    });
  }

  @override
  Widget contentView(BuildContext context) {
    final fraction = (size.width - 2 * _leftRightPadding) / size.width;
    _pageController = PageController(viewportFraction: fraction);
    return _contentView();
  }

  Widget _contentView() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: size.height * 0.45,
          color: AppColor.darkGrey,
        ),
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.45 + 100,
                  child: _pageView(),
                ),
                SizedBox(height: 60),
                PageControlView(count: data.length, selected: _currentPage),
                SizedBox(height: 30),
                _shoppingButtonView(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _pageView() {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: _interItemSpacing / 2),
          child: _pageItemView(index),
        );
      },
    );
  }

  Widget _shoppingButtonView() {
    return AppButton(
      title: "Shopping now",
      controller: _shoppingNowButtonController,
      backgroundColor: AppColor.alphaWhite,
      borderColor: AppColor.white,
    );
  }

  Widget _pageItemView(int index) {
    return Column(
      children: [
        SizedBox(
          height: 34,
          child: Text(
            data[index].title,
            style: AppTextStyle.osM20.black,
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 20,
          child: Text(
            data[index].subTitle,
            style: AppTextStyle.osL14.black,
          ),
        ),
        SizedBox(height: 30),
        Container(
          height: size.height * 0.45,
          width: double.infinity,
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          decoration: BoxDecoration(
            color: AppColor.lightGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image(
            image: AppAsset.loadImage(data[index].image),
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
