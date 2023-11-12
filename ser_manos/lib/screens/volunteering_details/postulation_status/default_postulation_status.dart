import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/modal.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
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
          const Column(
            children: [
              Text(
                'No hay vacantes disponibles para postularse',
                style: SermanosTypography.body01(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
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
                            ref, currentUser!, volunteeringDetails),
                        primaryButtonText: 'Confirmar',
                        secondaryButtonText: 'Cancelar');
                  },
                ),
            enabled: canPostulate)
      ]);
    });
  }
}

void handlePostulation(WidgetRef ref, SermanosUser currentUser,
    VolunteeringDetails volunteeringDetails) {
  VolunteeringPostulation postulation = VolunteeringPostulation(
      volunteeringId: volunteeringDetails.id,
      status: VolunteeringPostulationStatus.pending);
  ref
      .watch(loggedUserProvider.notifier)
      .setVolunteeringPostulation(postulation);
  ref
      .watch(userRepositoryProvider)
      .updateUser(currentUser, postulation.toJson());
}
