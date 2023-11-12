import 'package:cached_network_image/cached_network_image.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:flutter/material.dart';

class SermanosCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String errorImg;
  final BoxFit errorFit;
  final Color errorColor;
  final Color placeholderColor;

  const SermanosCachedNetworkImage(
      {Key? key,
      this.imageUrl = "",
      this.width = double.infinity,
      this.fit = BoxFit.cover,
      this.errorImg = "assets/images/logo_big.png",
      this.errorFit = BoxFit.fitHeight,
      this.errorColor = SermanosColors.neutral0,
      this.placeholderColor = SermanosColors.neutral0,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorWidget: (BuildContext context, String s, dynamic) {
        return ColoredBox(
          color: errorColor,
          child: Image.asset(
            width: width,
            fit: errorFit,
            errorImg,
            height: height,
          ),
        );
      },
      placeholder: (BuildContext context, String url) {
        return ColoredBox(
          color: placeholderColor,
        );
      },
    );
  }
}
