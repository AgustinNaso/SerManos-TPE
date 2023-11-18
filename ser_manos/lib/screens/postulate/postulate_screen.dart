import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/activity_card.dart';
import 'package:ser_manos/config/cellules/volunteering_card.dart';
import 'package:ser_manos/config/molecules/inputs/sermanos_search_bar.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/data/models/volunteering_postulation.dart';
import 'package:ser_manos/providers/search_bar_controller.dart';
import 'package:ser_manos/providers/user_provider.dart';
import 'package:ser_manos/screens/postulate/volunteerings_not_found.dart';

class PostulateScreen extends ConsumerWidget {
  const PostulateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SermanosUser loggedUser = ref.watch(loggedUserProvider)!;
    final futureVolunteeringsList = ref.watch(searchBarControllerProvider);

    return futureVolunteeringsList.when(
      data: (volunteeringsList) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: SermanosColors.secondary10,
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const SizedBox(
                      height: 24,
                    ),
                    SermanosSearchBar(
                        onSubmit: (query) => ref
                            .read(searchBarControllerProvider.notifier)
                            .search(query)),
                    const SizedBox(
                      height: 32,
                    ),
                  ])),
              SliverToBoxAdapter(
                  child: Column(children: [
                if (loggedUser.volunteeringPostulation.status !=
                    VolunteeringPostulationStatus.notPostulated)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.activityTitle,
                          style: const SermanosTypography.headline01(
                              color: SermanosColors.neutral100)),
                      const SizedBox(
                        height: 24,
                      ),
                      ActivityCard(
                          volunteeringId: loggedUser
                              .volunteeringPostulation.volunteeringId),
                      const SizedBox(height: 24)
                    ],
                  )
              ])),
              SliverToBoxAdapter(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(AppLocalizations.of(context)!.volunteersTitle,
                        style: const SermanosTypography.headline01(
                            color: SermanosColors.neutral100)),
                    const SizedBox(
                      height: 24,
                    )
                  ])),
              volunteeringsList.isNotEmpty
                  ? SliverList.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 24,
                          ),
                      itemBuilder: (context, index) {
                        return VolunteeringCard(
                            volunteeringInfo: volunteeringsList[index]);
                      },
                      itemCount: volunteeringsList.length)
                  : const SliverToBoxAdapter(child: VolunteeringNotFound())
            ]));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text(error.toString()),
    );
  }
}
