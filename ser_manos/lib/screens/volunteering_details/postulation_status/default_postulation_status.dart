import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/modal.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/models/volunteering_details_model.dart';
import 'package:ser_manos/data/models/volunteering_postulation.dart';
import 'package:ser_manos/providers/repository_provider.dart';
import 'package:ser_manos/providers/user_provider.dart';

class DefaultPostulationStatus extends StatelessWidget {
  final VolunteeringDetails volunteeringDetails;
  const DefaultPostulationStatus({Key? key, required this.volunteeringDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool canPostulate = volunteeringDetails.vacancies > 0;
    return Consumer(builder: (context, ref, child) {
      final currentUser = ref.watch(loggedUserProvider);

      return Column(children: [
        if (!canPostulate)
          Column(
            children: [
              Text(
                AppLocalizations.of(context)!.noVacancy,
                style: const SermanosTypography.body01(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
            ],
          ),
        SermanosCtaButton(
            text: 'Postularme',
            onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Modal(
                        title: volunteeringDetails.name,
                        subtitle: 'Te estas por postular a',
                        onAccept: () => handlePostulation(
                            ref, currentUser!.id, volunteeringDetails),
                        primaryButtonText:
                            AppLocalizations.of(context)!.confirm,
                        secondaryButtonText:
                            AppLocalizations.of(context)!.cancel);
                  },
                ),
            enabled: canPostulate)
      ]);
    });
  }
}

void handlePostulation(
    WidgetRef ref, String uid, VolunteeringDetails volunteeringDetails) {
  VolunteeringPostulation postulation = VolunteeringPostulation(
      volunteeringId: volunteeringDetails.volunteeringId,
      status: VolunteeringPostulationStatus.pending);
  ref.read(userRepositoryProvider).updateUser(uid, postulation.toJson()).then(
      (value) => ref
          .read(loggedUserProvider.notifier)
          .setVolunteeringPostulation(postulation));
}
