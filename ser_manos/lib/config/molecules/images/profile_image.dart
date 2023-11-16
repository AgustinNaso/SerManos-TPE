import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ser_manos/config/molecules/images/sermanos_cached_network_image.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const ProfileImage({Key? key, this.imageUrl = "", this.size = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl != ""
        ? ClipOval(
            child: imageUrl!.contains("http")
                ? SermanosCachedNetworkImage(
                    imageUrl: imageUrl!,
                    height: size,
                    width: size,
                  )
                : Image.file(
                    File(imageUrl!),
                    height: size,
                    width: size,
                    fit: BoxFit.cover,
                  ))
        : SizedBox(
            child: Icon(Icons.account_circle_outlined,
                size: size, color: SermanosColors.secondary100),
          );
  }
}
