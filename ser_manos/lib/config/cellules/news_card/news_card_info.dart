import 'package:flutter/material.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';

import '../../tokens/sermanos_typography.dart';


class NewsCardInfo extends StatelessWidget {
  const NewsCardInfo({
    super.key,
    required this.source,
    required this.title,
    required this.subtitle,
  });
  final String source;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                source.toUpperCase(),
                style: const SermanosTypography.overline(
                  color: Colors.grey,//TODO: change to SermanosColors when available
                ),
              ),
              Text(
                title,
                style: const SermanosTypography.subtitle01(
                ),
              ),
              Text(
                subtitle,
                style: const SermanosTypography.subtitle01(
                  color: Colors.grey,//TODO: change to SermanosColors when available
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: ()=>{},
                  child: Text(
                    'Leer más',
                    ),
                  )
                ]
              )
        ],
      ),
    );
  }
}
