import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/cellules/information_card.dart';
import 'package:ser_manos/config/molecules/images/sermanos_cached_network_image.dart';
import 'package:ser_manos/config/molecules/vacancies/vacancies.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/models/volunteering_details_model.dart';
import 'package:ser_manos/data/models/volunteering_postulation.dart';
import 'package:ser_manos/providers/Future/volunteering_provider.dart';
import 'package:ser_manos/providers/user_provider.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/accepted_postulation_status.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/already_postulated_postulation_status.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/default_postulation_status.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/pending_postulation_status.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class VolunteeringScreen extends ConsumerWidget {
  final String volunteeringId;

  const VolunteeringScreen({Key? key, required this.volunteeringId})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureVolunteeringDetail =
        ref.watch(getVolunteeringDetailsProvider(volunteeringId));
    final SermanosUser? loggedUser = ref.watch(loggedUserProvider);

    final locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
        body: futureVolunteeringDetail.when(
      data: (volunteeringDetail) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(children: [
                SermanosCachedNetworkImage(
                    imageUrl: volunteeringDetail.imgUrl, height: 243),
                Positioned.fill(
                    child: Container(
                        decoration: const BoxDecoration(
                  color: SermanosColors.neutral0,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [SermanosColors.neutral200, Colors.transparent],
                    stops: [0.0, 0.3],
                  ),
                ))),
                Positioned(
                  top: 0,
                  left: 0,
                  child: IconButton(
                      onPressed: () => {GoRouter.of(context).pop()},
                      icon:
                          SermanosIcons.back(status: SermanosIconStatus.back)),
                )
              ]),
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(volunteeringDetail.category,
                          style: const SermanosTypography.overline(
                              color: SermanosColors.neutral75)),
                      Text(volunteeringDetail.name,
                          style: const SermanosTypography.headline01()),
                      const SizedBox(height: 16),
                      Text(volunteeringDetail.description,
                          style: const SermanosTypography.body01(
                              color: SermanosColors.secondary200)),
                      const SizedBox(height: 24),
                      Text(AppLocalizations.of(context)!.aboutActivity,
                          style: const SermanosTypography.defaultHeadline()),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(volunteeringDetail.about,
                          style: const SermanosTypography.body01()),
                      const SizedBox(height: 24),
                      InformationCard(
                          title: AppLocalizations.of(context)!.location,
                          information: [
                            (
                              AppLocalizations.of(context)!.direction,
                              volunteeringDetail.location
                            )
                          ]),
                      const SizedBox(height: 24),
                      Text(AppLocalizations.of(context)!.participate,
                          style: const SermanosTypography.defaultHeadline()),
                      const SizedBox(height: 8),
                      Text(AppLocalizations.of(context)!.requirements,
                          style: const SermanosTypography.subtitle01()),
                      const SizedBox(height: 8),
                      ListView.builder(
                        padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: volunteeringDetail.requirements.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: SermanosColors.neutral100,
                                size: 5,
                              ),
                              const SizedBox(width: 8),
                              Text(volunteeringDetail.requirements[index],
                                  style: const SermanosTypography.body01()),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(AppLocalizations.of(context)!.availability,
                          style: const SermanosTypography.subtitle01()),
                      const SizedBox(height: 8),
                      ListView.builder(
                        padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: volunteeringDetail.availability.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: SermanosColors.neutral100,
                                size: 5,
                              ),
                              const SizedBox(width: 8),
                              Text(volunteeringDetail.availability[index],
                                  style: const SermanosTypography.body01()),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(AppLocalizations.of(context)!.additionalInfo,
                          style: const SermanosTypography.subtitle01()),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Column(
                          children: [
                            Row(children: [
                              const Icon(
                                Icons.circle,
                                color: SermanosColors.neutral100,
                                size: 5,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                  AppLocalizations.of(context)!
                                      .additionalInfoPrice(
                                          NumberFormat.currency(locale: locale)
                                              .format(
                                                  volunteeringDetail.price)),
                                  style: const SermanosTypography.body01()),
                            ]),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  color: SermanosColors.neutral100,
                                  size: 5,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                    AppLocalizations.of(context)!
                                        .additionalInfoDate(
                                            DateFormat.yMd(locale).format(
                                                volunteeringDetail.date),
                                            DateFormat.Hm(locale).format(
                                                volunteeringDetail.date)),
                                    style: const SermanosTypography.body01()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Vacancies(vacancy: 10),
                      const SizedBox(height: 24),
                      handleVolunteeringStatus(
                          loggedUser!.volunteeringPostulation,
                          volunteeringDetail),
                    ],
                  ))
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text(error.toString()),
    ));
  }
}

Widget handleVolunteeringStatus(VolunteeringPostulation userPostulation,
    VolunteeringDetails volunteeringDetails) {
  if (volunteeringDetails.vacancies == 0 ||
      userPostulation.status == VolunteeringPostulationStatus.notPostulated) {
    return DefaultPostulationStatus(volunteeringDetails: volunteeringDetails);
  }
  if (userPostulation.status == VolunteeringPostulationStatus.pending &&
      userPostulation.volunteeringId == volunteeringDetails.volunteeringId) {
    return PendingPostulationStatus(volunteeringName: volunteeringDetails.name);
  }
  if (userPostulation.status == VolunteeringPostulationStatus.accepted ||
      userPostulation.status == VolunteeringPostulationStatus.pending &&
          userPostulation.volunteeringId !=
              volunteeringDetails.volunteeringId) {
    return const AlreadyPostulatedPostulationStatus();
  }
  return AcceptedPostulationStatus(volunteeringName: volunteeringDetails.name);
}
