import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/volunteering_card.dart';
import 'package:ser_manos/config/molecules/userInputs/sermanos_search_bar.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/volunteering_model.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/providers/Future/volunteering_provider.dart';
import 'package:ser_manos/screens/postulate/volunteerings_not_found.dart';



final searchQueryProvider = StateProvider<String>((ref) => '');

class PostulateScreen extends ConsumerWidget {
  const PostulateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryProvider);
    final futureVolunteeringsList = ref.watch(getVolunteeringsProvider);

    return futureVolunteeringsList.when(
      data: (volunteeringsList) {
        final List<Volunteering> filteredVolunteerings = volunteeringsList
            .where((volunteering) => volunteering.name
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
            .toList();
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
                  SermanosSearchBar(
                      onChange: (query) =>
                          ref.read(searchQueryProvider.notifier).state = query),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(AppLocalizations.of(context)!.volunteersTitle,
                      style: const SermanosTypography.headline01(
                          color: SermanosColors.neutral100)),
                  const SizedBox(
                    height: 24,
                  ),
                  filteredVolunteerings.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 24,
                                  ),
                              itemBuilder: (context, index) {
                                return VolunteeringCard(
                                    volunteeringInfo:
                                        filteredVolunteerings[index],
                                    isFavorite: false);
                              },
                              itemCount: filteredVolunteerings.length))
                      : const VolunteeringNotFound()
                ]));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text(error.toString()),
    );
  }
}
