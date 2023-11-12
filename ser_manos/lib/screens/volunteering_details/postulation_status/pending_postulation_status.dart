import 'package:flutter/material.dart';
import 'package:ser_manos/config/cellules/modal.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/postulation_status.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class PendingPostulationStatus extends StatelessWidget {
  final String volunteeringName;
  const PendingPostulationStatus({Key? key, required this.volunteeringName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostulationStatus(
        title: AppLocalizations.of(context)!.applied,
        description:
            AppLocalizations.of(context)!.appliedDescription,
        buttonText: AppLocalizations.of(context)!.withdrawAppliance,
        onButtonPressed: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Modal(
                        title: volunteeringName,
                        subtitle:
                            AppLocalizations.of(context)!.withdrawApplianceConfirmation,
                        onAccept: () {},
                        primaryButtonText: AppLocalizations.of(context)!.cancel,
                        secondaryButtonText: AppLocalizations.of(context)!.confirm);
                  })
            });
  }
}
