import 'package:flutter/material.dart';
import 'package:ser_manos/config/cellules/modal.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

class DefaultPostulationStatus extends StatelessWidget {
  final bool canPostulate;
  const DefaultPostulationStatus({Key? key, required this.canPostulate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      title: 'Un techo para mi Pais',
                      subtitle: 'Te estas por postular a',
                      onAccept: () {
                        print('aceptado');
                      },
                      primaryButtonText: 'Confirmar',
                      secondaryButtonText: 'Cancelar');
                },
              ),
          enabled: canPostulate)
    ]);
  }
}