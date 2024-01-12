import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/core/coordinator/coordinator.dart';
import 'package:flutter_demo/core_ui/alert_dialog/app_alert_dialog.dart';
import 'package:flutter_demo/core_ui/button/app_button.dart';
import 'package:flutter_demo/core_ui/navigation_view/back_navigation_view.dart';
import 'package:flutter_demo/core_ui/textfield/app_textfield.dart';
import 'package:flutter_demo/domain/_auth/auth_route.dart';
import 'package:flutter_demo/features/auth/forgot_password/forgot_password_view_model.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends BaseViewState<ForgotPasswordView> {
  final _viewModel = ForgotPasswordViewModel();

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
          Text("Forgot password?", style: AppTextStyle.osM24),
          SizedBox(height: 20),
          Text(
            "Enter email associated with your account and we'll send and email with instructions to reset your password",
            style: AppTextStyle.osL16.copyWith(height: 1.4),
          ),
          SizedBox(height: 54),
          AppTextField(placeholder: "Enter your email here"),
          SizedBox(height: 106),
          Container(
            alignment: Alignment.center,
            child: AppButton(
              title: "Continue",
              onPressed: () {
                // showSuccessAlert(message: "This a sample success alert dialog message with two lines.");
                app.coordinator.push(AuthRoute.verifyOTP);
              },
            ),
          ),
        ],
      ),
    );
  }
}
