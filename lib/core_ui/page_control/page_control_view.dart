import 'package:flutter/material.dart';
import 'package:flutter_demo/resources/app_color.dart';

class PageControlView extends StatelessWidget {
  final int count;
  final int selected;

  const PageControlView({
    super.key,
    required this.count,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _dotView(index == selected);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
        itemCount: count,
      ),
    );
  }

  Widget _dotView(bool isSelected) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: isSelected ? AppColor.white : AppColor.transparent,
        border: Border.all(color: AppColor.white),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
