import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/volunteering_card.dart';
import 'package:ser_manos/config/molecules/userInputs/sermanos_search_bar.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/volunteering_model.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../config/tokens/sermanos_colors.dart';
import '../providers/volunteering_provider.dart';

class PostulateScreen extends ConsumerWidget {
  const PostulateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureVolunteeringsList = ref.watch(getVolunteeringsProvider);
    return futureVolunteeringsList.when(
      data: (data) {
        final List<Volunteering> volunteerings = data;
        return Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            color: SermanosColors.secondary10,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  SermanosSearchBar(onChange: (text) => text),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(AppLocalizations.of(context)!.volunteersTitle,
                      style: const SermanosTypography.headline01(
                          color: SermanosColors.neutral100)),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 24,
                              ),
                          itemBuilder: (context, index) {
                            return VolunteeringCard(
                                volunteeringInfo: volunteerings[index],
                                isFavorite: false);
                          },
                          itemCount: volunteerings.length)),
                ]));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text(error.toString()),
    );
  }
}
