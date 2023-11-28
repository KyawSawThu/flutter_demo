import 'package:flutter/material.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/features/discover/discover/discover_view_model.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends BaseViewState<DiscoverView> {
  final _viewModel = DiscoverViewModel();

  @override
  BaseViewModel viewModel() => _viewModel;

  @override
  Widget contentView(BuildContext context) {
    return Center(
      child: Text("Discover"),
    );
  }
}
