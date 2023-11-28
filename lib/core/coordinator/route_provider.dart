import 'package:flutter/material.dart';

abstract class RouteProvider {
  Widget? view(RouteSettings settings);
}