import 'package:flutter/material.dart';

class SpaceBetween extends StatelessWidget {
  const SpaceBetween({Key? key, this.horizontalSpace, this.verticalSpace})
      : super(key: key);
  final double? horizontalSpace;
  final double? verticalSpace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: horizontalSpace,
      height: verticalSpace,
    );
  }
}
