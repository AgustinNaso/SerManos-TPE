import 'package:flutter/material.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

import '../tokens/sermanos_colors.dart';

class InformationCard extends StatelessWidget {
  final String title;

  final List<(String, String)> information;

  const InformationCard({
    Key? key,
    required this.title,
    required this.information,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: SermanosColors.neutral0,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: SermanosColors.secondary25,
            ),
            width: double.infinity,
            child: Text(
              title,
              style: const SermanosTypography.subtitle01(
                  color: SermanosColors.neutral200),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: const BoxDecoration(
              color: SermanosColors.neutral10,
            ),
            width: double.infinity,
            child: ListView.separated(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 8),
              itemCount: information.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      information[index].$1.toUpperCase(),
                      style: const SermanosTypography.overline(
                        color: SermanosColors.neutral75,
                      ),
                    ),
                    Text(
                      information[index].$2,
                      style: const SermanosTypography.body01(
                        color: SermanosColors.neutral200,
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
