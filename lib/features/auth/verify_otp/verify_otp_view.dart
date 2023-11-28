import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/base/base_view.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/core/coordinator/coordinator.dart';
import 'package:flutter_demo/core_ui/button/app_button.dart';
import 'package:flutter_demo/core_ui/navigation_view/back_navigation_view.dart';
import 'package:flutter_demo/core_ui/otp/otp_view.dart';
import 'package:flutter_demo/domain/_auth/auth_route.dart';
import 'package:flutter_demo/features/auth/verify_otp/verify_otp_view_model.dart';
import 'package:flutter_demo/resources/app_color.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class VerifyOTPView extends StatefulWidget {
  const VerifyOTPView({super.key});

  @override
  State<VerifyOTPView> createState() => _VerifyOTPViewState();
}

class _VerifyOTPViewState extends BaseViewState<VerifyOTPView> {
  final _viewModel = VerifyOTPViewModel();

  @override
  BaseViewModel viewModel() => _viewModel;

  @override
  Widget navigationView() => BackNavigationView();

  @override
  Widget contentView(BuildContext context) {
    return _contentView();
  }

  Widget _contentView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 60),
          Text("Verification code", style: AppTextStyle.osM24),
          SizedBox(height: 20),
          Text(
            "Please enter the verification code we sent to your email address",
            style: AppTextStyle.osL16.copyWith(height: 1.4),
          ),
          SizedBox(height: 58),
          OTPView(
            textStyle: AppTextStyle.osL16,
            onComplete: (e) {},
            onChange: (e) {},
          ),
          // Container(
          //   height: 58,
          //   decoration: BoxDecoration(border: Border.all(color: AppColor.lightGrey)),
          // ),
          SizedBox(height: 48),
          Text("Resend in 00:10", style: AppTextStyle.osL16),
          SizedBox(height: 106),
          Container(
            alignment: Alignment.center,
            child: AppButton(
              title: "Verify",
              onPressed: () => app.coordinator.removePush(AuthRoute.newPassword, routes: [AuthRoute.forgotPassword, AuthRoute.verifyOTP]),
            ),
          ),
        ],
      ),
    );
  }
}
