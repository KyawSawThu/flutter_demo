import 'package:flutter/material.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseViewState<ProfileView> {
  @override
  BaseViewModel viewModel() => BaseViewModel();

  @override
  Widget contentView(BuildContext context) {
    return Center(
      child: Text("Profile"),
    );
  }
}
