import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/base/base_view.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/core/coordinator/coordinator.dart';
import 'package:flutter_demo/core/rx/controllers/button_controller.dart';
import 'package:flutter_demo/core_ui/button/app_button.dart';
import 'package:flutter_demo/core_ui/button/app_text_button.dart';
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
  late VerifyOTPOutput _output;
  final _resendButtonController = ButtonController();
  final _verifyButtonController = ButtonController();

  @override
  BaseViewModel viewModel() => _viewModel;

  @override
  Widget navigationView() => BackNavigationView();

  @override
  void prepareInput() {
    super.prepareInput();
    final input = VerifyOTPInput(
      onStart: view.onStart,
      onTapResend: _resendButtonController.onTap,
    );

    _output = _viewModel.transform(input);
  }

  @override
  void observeOutput() {
    super.observeOutput();
  }

  @override
  Widget contentView(BuildContext context) {
    return _contentView();
  }

  Widget _contentView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          StreamBuilder(
            stream: _output.didCountDownFinished,
            builder: (context, snapshot) {
              return (snapshot.data ?? false)
                  ? _resendButtonView()
                  : _resendCountDownView();
            },
          ),
          SizedBox(height: 106),
          Container(
            alignment: Alignment.center,
            child: AppButton(
              title: "Verify",
              onPressed: () => app.coordinator.removePush(AuthRoute.newPassword,
              routes: [AuthRoute.forgotPassword, AuthRoute.verifyOTP]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _resendCountDownView() {
    return StreamBuilder(
      stream: _output.countDown,
      builder: (context, snapshot) {
        return Text(snapshot.data ?? "", style: AppTextStyle.osL16);
      },
    );
  }

  Widget _resendButtonView() {
    return AppTextButton(
      title: "Resend",
      controller: _resendButtonController,
    );
  }
}
