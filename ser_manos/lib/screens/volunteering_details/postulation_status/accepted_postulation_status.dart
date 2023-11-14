import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/modal.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/providers/repository_provider.dart';
import 'package:ser_manos/providers/user_provider.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/postulation_status.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class AcceptedPostulationStatus extends StatelessWidget {
  final String volunteeringName;
  const AcceptedPostulationStatus({Key? key, required this.volunteeringName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final currentUser = ref.read(loggedUserProvider);
        return PostulationStatus(
            title: AppLocalizations.of(context)!.participating,
            description:
                AppLocalizations.of(context)!.orgConfirmatedParticipation,
            buttonText: AppLocalizations.of(context)!.leaveVolunteering,
            onButtonPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Modal(
                            title: volunteeringName,
                            subtitle:
                                AppLocalizations.of(context)!.leaveConfirmation,
                            onAccept: () {
                              handleQuitPostulation(ref, currentUser!);
                            },
                            primaryButtonText:
                                AppLocalizations.of(context)!.confirm,
                            secondaryButtonText:
                                AppLocalizations.of(context)!.cancel);
                      })
                });
      },
    );
  }
}

void handleQuitPostulation(WidgetRef ref, SermanosUser currentUser) {
  ref.read(loggedUserProvider.notifier).removeVolunteeringPostulation();
  ref
      .read(userRepositoryProvider)
      .updateUser(currentUser.id, {"volunteeringPostulation": currentUser.volunteeringPostulation});
}
