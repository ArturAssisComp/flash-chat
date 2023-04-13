import 'package:flutter/material.dart';

class HeroImageAsset extends StatelessWidget {
  const HeroImageAsset(
      {Key? key,
      required this.tag,
      required this.height,
      required this.imageAssetName})
      : super(key: key);
  final String tag;
  final double height;
  final String imageAssetName;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: SizedBox(
        height: height,
        child: Image.asset(imageAssetName),
      ),
    );
  }
}
