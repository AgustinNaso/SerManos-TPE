import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/volunteering_card.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/volunteering_model.dart';

import '../config/tokens/sermanos_colors.dart';
import '../providers/volunteering_provider.dart';

class PostulateScreen extends ConsumerWidget {
  const PostulateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(getVolunteeringsProvider);
    return service.when(
      data: (data) {
        final List<Volunteering> volunteerings = data;
        return Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text("Voluntariados",
                      style: SermanosTypography.headline01(
                          color: SermanosColors.neutral100)),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 16,
                              ),
                          itemBuilder: (context, index) {
                            return VolunteeringCard(
                                volunteeringInfo: volunteerings[index],
                                isFavorite: false);
                          },
                          itemCount: volunteerings.length)),
                  SizedBox(height: 16)
                ]));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text(error.toString()),
    );
  }
}
