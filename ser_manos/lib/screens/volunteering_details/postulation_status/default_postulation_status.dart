import 'package:flutter/material.dart';
import 'package:ser_manos/config/cellules/modal.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class DefaultPostulationStatus extends StatelessWidget {
  final bool canPostulate;
  const DefaultPostulationStatus({Key? key, required this.canPostulate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      title: 'Un techo para mi Pais', //TODO: WHAT TO DO HERE?
                      subtitle: AppLocalizations.of(context)!.postulating,
                      onAccept: () {
                        print('aceptado');
                      },
                      primaryButtonText: AppLocalizations.of(context)!.confirm,
                      secondaryButtonText: AppLocalizations.of(context)!.cancel);
                },
              ),
          enabled: canPostulate)
    ]);
  }
}
