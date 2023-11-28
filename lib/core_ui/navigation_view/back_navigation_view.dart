import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/coordinator/coordinator.dart';
import 'package:flutter_demo/core_ui/image/app_image.dart';
import 'package:flutter_demo/core_ui/navigation_view/navigation_view.dart';
import 'package:flutter_demo/resources/app_asset.dart';
import 'package:flutter_demo/resources/app_color.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

enum TitleAlignment {
  left,
  center;
}

class BackNavigationView extends NavigationView {
  final String title;
  final TitleAlignment alignment;

  const BackNavigationView({
    super.key,
    this.title = "",
    this.alignment = TitleAlignment.center,
  });

  @override
  Widget navigationView() {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: Stack(
        children: [
          GestureDetector(
            onTap: app.coordinator.dismiss,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.grey.withOpacity(0.75),
                    offset: Offset(0, 0.5),
                    blurRadius: 0.5,
                  )
                ],
                borderRadius: BorderRadius.circular(18),
              ),
              child: AppImage(
                width: 36,
                height: 36,
                color: AppColor.black,
                assets: AppAsset.icChevronLeft,
              ),
            ),
          ),
          alignment == TitleAlignment.center
              ? _centerTitleView()
              : _leftTitleView(),
        ],
      ),
    );
  }

  Widget _leftTitleView() {
    return Positioned.fill(
      left: 48,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: AppTextStyle.osM16),
      ),
    );
  }

  Widget _centerTitleView() {
    return Container(
      alignment: Alignment.center,
      child: Text(title, style: AppTextStyle.osM16),
    );
  }
}
