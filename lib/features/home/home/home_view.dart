import 'package:flutter/material.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/features/home/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseViewState<HomeView> {
  final _viewModel = HomeViewModel();

  @override
  BaseViewModel viewModel() => _viewModel;

  @override
  Widget contentView(BuildContext context) {
    return Center(
      child: Text("Home"),
    );
  }

}
