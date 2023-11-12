import 'package:flutter/material.dart';
import 'package:ser_manos/config/cellules/modal.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/postulation_status.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class AcceptedPostulationStatus extends StatelessWidget {
  final String volunteeringName;
  const AcceptedPostulationStatus({Key? key, required this.volunteeringName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        onAccept: () {},
                        primaryButtonText: AppLocalizations.of(context)!.confirm,
                        secondaryButtonText: AppLocalizations.of(context)!.cancel);
                  })
            });
  }
}
