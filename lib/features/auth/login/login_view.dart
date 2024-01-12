import 'package:flutter_demo/core/coordinator/coordinator.dart';
import 'package:flutter_demo/core/extensions/stream_extensions.dart';
import 'package:flutter_demo/core_ui/textfield/password_textfield.dart';
import 'package:flutter_demo/domain/_onboard/onboard_route.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/base/base_view.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/core/rx/controllers/button_controller.dart';
import 'package:flutter_demo/core/rx/controllers/textfield_controller.dart';
import 'package:flutter_demo/core_ui/button/app_button.dart';
import 'package:flutter_demo/core_ui/button/app_text_button.dart';
import 'package:flutter_demo/core_ui/textfield/app_textfield.dart';
import 'package:flutter_demo/domain/_auth/auth_route.dart';
import 'package:flutter_demo/features/auth/login/login_form.dart';
import 'package:flutter_demo/features/auth/login/login_view_model.dart';
import 'package:flutter_demo/resources/app_asset.dart';
import 'package:flutter_demo/resources/app_color.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseViewState<LoginView> {
  @override
  BaseViewModel viewModel() => _viewModel;

  @override
  SafeAreaConfig safeAreaConfig() {
    return SafeAreaConfig(
      enableTopSafeArea: true,
      enableBottomSafeArea: true,
    );
  }

  final _viewModel = LoginViewModel();
  final _emailTextController = TextFieldController();
  final _passwordTextController = TextFieldController();
  final _loginButtonController = ButtonController();
  late LoginOutput _output;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _loginButtonController.dispose();
    super.dispose();
  }

  @override
  void prepareInput() {
    final form = Rx.combineLatest2(
      _emailTextController.text.orEmpty(),
      _passwordTextController.text.orEmpty(),
      (email, password) => LoginForm(email: email, password: password),
    );

    final input = LoginInput(
      didTapLogin: _loginButtonController.onTap,
      form: form,
    );
    _output = _viewModel.transform(input);
  }

  @override
  void observeOutput() {
    super.observeOutput();
    _output.success.listen((event) {
      print("login success");
      app.coordinator.replacePresent(OnboardRoute.tab);
    });
    _output.isValidForm.listen((event) {
      print(event);
    });
  }

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
          Text("Log into\nyour account", style: AppTextStyle.osM24),
          SizedBox(height: 20),
          _emailTextField(),
          _passwordTextField(),
          Container(
            alignment: Alignment.centerRight,
            child: AppTextButton(
              title: "Forgot password?",
              onPressed: () => app.coordinator.push(AuthRoute.forgotPassword),
            ),
          ),
          SizedBox(height: 44),
          Container(
            alignment: Alignment.center,
            child: AppButton(
              title: "LOG IN",
              controller: _loginButtonController,
            ),
          ),
          SizedBox(height: 28),
          Text(
            "or log in with",
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

  Widget _emailTextField() {
    return StreamBuilder(
      stream: _output.formError,
      builder: (context, snapshot) {
        return AppTextField(
          placeholder: "Email address",
          controller: _emailTextController,
          error: snapshot.data?.error(LoginFormField.email),
        );
      },
    );
  }

  Widget _passwordTextField() {
    return StreamBuilder(
      stream: _output.formError,
      builder: (context, snapshot) {
        return PasswordTextField(
          placeholder: "Password",
          controller: _passwordTextController,
          error: snapshot.data?.error(LoginFormField.password),
        );
      },
    );
  }

  Widget _loginButtonView() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account?", style: AppTextStyle.osR14),
          SizedBox(width: 8),
          AppTextButton(
            title: "Sign Up",
            style: AppTextStyle.osR14
                .copyWith(decoration: TextDecoration.underline),
            onPressed: () => app.coordinator.dismiss,
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
