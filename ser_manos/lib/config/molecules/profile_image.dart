import 'package:flutter/material.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;

  const ProfileImage({Key? key, this.imageUrl = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl == ""
        ? const SizedBox(
            child: Icon(Icons.account_circle_outlined,
                size: 100, color: SermanosColors.secondary100),
          )
        : SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl!),
            ));
  }
}
