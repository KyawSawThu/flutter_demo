import 'package:flutter/material.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/features/cart/cart/cart_view_model.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends BaseViewState<CartView> {
  final _viewModel = CartViewModel();

  @override
  BaseViewModel viewModel() => _viewModel;

  @override
  Widget contentView(BuildContext context) {
    return Center(
      child: Text("Cart"),
    );
  }

}
