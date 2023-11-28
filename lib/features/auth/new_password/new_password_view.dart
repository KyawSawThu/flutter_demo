import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/core_ui/button/app_button.dart';
import 'package:flutter_demo/core_ui/navigation_view/back_navigation_view.dart';
import 'package:flutter_demo/core_ui/textfield/app_textfield.dart';
import 'package:flutter_demo/domain/_auth/auth_route.dart';
import 'package:flutter_demo/features/auth/new_password/new_password_view_model.dart';
import 'package:flutter_demo/resources/app_color.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends BaseViewState<NewPasswordView> {
  final _viewModel = NewPasswordViewModel();

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
          Text("Create new password", style: AppTextStyle.osM24),
          SizedBox(height: 20),
          Text(
            "Your new password must be different from previously used password",
            style: AppTextStyle.osL16.copyWith(height: 1.4),
          ),
          SizedBox(height: 58),
          AppTextField(placeholder: "New Password"),
          SizedBox(height: 20),
          AppTextField(placeholder: "Confirm Password"),
          SizedBox(height: 106),
          Container(
            alignment: Alignment.center,
            child: AppButton(
              title: "Confirm",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
