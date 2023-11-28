import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/core/coordinator/coordinator.dart';
import 'package:flutter_demo/core_ui/button/app_button.dart';
import 'package:flutter_demo/core_ui/button/app_text_button.dart';
import 'package:flutter_demo/core_ui/textfield/app_textfield.dart';
import 'package:flutter_demo/domain/_auth/auth_route.dart';
import 'package:flutter_demo/features/auth/register/register_view_model.dart';
import 'package:flutter_demo/resources/app_asset.dart';
import 'package:flutter_demo/resources/app_color.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseViewState<RegisterView> {
  final _viewModel = RegisterViewModel();

  @override
  BaseViewModel viewModel() => _viewModel;

  @override
  Widget contentView(BuildContext context) {
    return _contentView();
  }

  Widget _contentView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Create\nyour account", style: AppTextStyle.osM24),
          SizedBox(height: 20),
          AppTextField(placeholder: "Username"),
          AppTextField(placeholder: "Email address"),
          AppTextField(placeholder: "Password"),
          AppTextField(placeholder: "Confirm Password"),
          SizedBox(height: 44),
          Container(
            alignment: Alignment.center,
            child: AppButton(title: "SIGN UP"),
          ),
          SizedBox(height: 28),
          Text(
            "or sign up with",
            style: AppTextStyle.osL12,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 28),
          _socialLoginView(),
          SizedBox(height: 28),
          Container(
            alignment: Alignment.center,
            child: _loginButtonView(),
          ),
        ],
      ),
    );
  }

  Widget _loginButtonView() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already have account?", style: AppTextStyle.osR14),
          SizedBox(width: 8),
          AppTextButton(
            title: "Log In",
            style: AppTextStyle.osR14
                .copyWith(decoration: TextDecoration.underline),
            onPressed: () => app.coordinator.present(AuthRoute.login),
          ),
        ],
      ),
    );
  }

  Widget _socialLoginView() {
    final images = [AppAsset.icApple, AppAsset.icGoogle, AppAsset.icFacebook];
    return Container(
      alignment: Alignment.center,
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _socialLoginButtonView(images[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 20);
        },
        itemCount: images.length,
      ),
    );
  }

  Widget _socialLoginButtonView(AssetImage image) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.lightGrey, width: 1),
        borderRadius: BorderRadius.circular(21),
      ),
      child: Image(image: image),
    );
  }
}
