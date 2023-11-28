import 'package:flutter/material.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';

class ViewConfig {
  Color? safeAreaColor;
  Color? backgroundColor;
  bool ignoreTopSafeArea;
  bool ignoreBottomSafeArea;

  ViewConfig({
    this.safeAreaColor,
    this.backgroundColor,
    this.ignoreTopSafeArea = false,
    this.ignoreBottomSafeArea = false,
  });
}

class BaseView extends StatelessWidget {
  final ViewConfig viewConfig;
  final Widget? navigationView;
  final Widget contentView;
  final BaseViewModel? viewModel;

  const BaseView({
    super.key,
    required this.viewConfig,
    this.navigationView,
    required this.contentView,
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final safeArea = MediaQuery.of(context).padding;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: viewConfig.backgroundColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              viewConfig.ignoreTopSafeArea
                  ? Container()
                  : Container(
                      height: safeArea.top,
                      color: viewConfig.safeAreaColor,
                    ),
              navigationView ?? Container(),
              Expanded(
                child: contentView,
              ),
              viewConfig.ignoreBottomSafeArea
                  ? Container()
                  : Container(
                      height: safeArea.bottom,
                      color: viewConfig.backgroundColor,
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
