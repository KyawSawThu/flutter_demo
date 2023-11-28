import 'package:flutter/material.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';

class SafeAreaConfig {
  Color? topSafeAreaColor;
  Color? bottomSafeAreaColor;
  bool enableTopSafeArea;
  bool enableBottomSafeArea;

  SafeAreaConfig({
    this.topSafeAreaColor = Colors.white,
    this.bottomSafeAreaColor = Colors.white,
    this.enableTopSafeArea = true,
    this.enableBottomSafeArea = true,
  });
}

class BaseView extends StatelessWidget {
  final SafeAreaConfig safeAreaConfig;
  final Widget? navigationView;
  final Widget contentView;
  final BaseViewModel? viewModel;

  const BaseView({
    super.key,
    required this.safeAreaConfig,
    this.navigationView,
    required this.contentView,
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final safeArea = MediaQuery.of(context).padding;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              safeAreaConfig.enableTopSafeArea
                  ? Container()
                  : Container(
                      height: safeArea.top,
                      color: safeAreaConfig.topSafeAreaColor,
                    ),
              navigationView ?? Container(),
              Expanded(
                child: contentView,
              ),
              safeAreaConfig.enableBottomSafeArea
                  ? Container()
                  : Container(
                      height: safeArea.bottom,
                      color: safeAreaConfig.bottomSafeAreaColor,
                    ),
            ],
          ),
          Container(
            height: safeArea.top,
            color: Colors.black.withOpacity(0.125),
          ),
        ],
      ),
    );
  }
}
