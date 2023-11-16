import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/tokens/sermanos_box_shadows.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/providers/Future/volunteering_provider.dart';

class ActivityCard extends ConsumerWidget {
  final String volunteeringId;

  const ActivityCard({Key? key, required this.volunteeringId})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteeringInfo =
        ref.read(getVolunteeringDetailsProvider(volunteeringId));
    return volunteeringInfo.when(
        data: (volunteeringInfo) {
          return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: SermanosColors.primary5,
                border: Border.all(color: SermanosColors.primary100, width: 2),
                borderRadius: BorderRadius.circular(6),
                boxShadow: SermanosShadows.shadow2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        volunteeringInfo.category,
                        style: const SermanosTypography.overline(
                            color: SermanosColors.neutral75),
                      ),
                      Text(volunteeringInfo.name,
                          style: const SermanosTypography.subtitle01()),
                    ],
                  ),
                  SermanosIcons.locationFilled(
                      status: SermanosIconStatus.activated)
                ],
              ));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => const Center(child: Text('Error')));
  }
}
