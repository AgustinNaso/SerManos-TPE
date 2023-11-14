import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/providers/user_provider.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/postulation_status.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class AlreadyPostulatedPostulationStatus extends StatelessWidget {
  const AlreadyPostulatedPostulationStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final currentUser = ref.watch(loggedUserProvider);
      return Column(children: [
        PostulationStatus(
            description: AppLocalizations.of(context)!.alreadyParticipating,
            buttonText: AppLocalizations.of(context)!.leaveActualVolunteering,
            onButtonPressed: () => {
                  GoRouter.of(context).go(
                      '/volunteering/${currentUser!.volunteeringPostulation.volunteeringId}')
                }),
        SermanosCtaButton(
          text: AppLocalizations.of(context)!.apply,
          onPressed: () => {},
          enabled: false,
        ),
      ]);
    });
  }
}
