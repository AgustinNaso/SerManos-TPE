import 'package:flutter/material.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/postulation_status.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class AlreadyPostulatedPostulationStatus extends StatelessWidget {
  const AlreadyPostulatedPostulationStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      PostulationStatus(
          description:
               AppLocalizations.of(context)!.alreadyParticipating,
          buttonText:  AppLocalizations.of(context)!.leaveActualVolunteering,
          onButtonPressed: () => {}),
      SermanosCtaButton(
        text:  AppLocalizations.of(context)!.apply,
        onPressed: () => {},
        enabled: false,
      ),
    ]);
  }
}
