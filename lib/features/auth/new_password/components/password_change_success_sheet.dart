import 'package:flutter/material.dart';
import 'package:flutter_demo/core_ui/button/app_button.dart';
import 'package:flutter_demo/core_ui/image/app_image.dart';
import 'package:flutter_demo/resources/app_asset.dart';
import 'package:flutter_demo/resources/app_color.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class PasswordChangeSuccessSheet extends StatelessWidget {
  const PasswordChangeSuccessSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: AppImage(
              width: 46,
              height: 56,
              assets: AppAsset.iconPasswordChangeSuccess,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Your password has been changed",
            style: AppTextStyle.osR16.darkBlack,
          ),
          SizedBox(height: 16),
          Text(
            "Welcome back! Discover now!",
            style: AppTextStyle.osR14.darkGrey,
          ),
          SizedBox(height: 20),
          AppButton(
            title: "Browse home",
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
