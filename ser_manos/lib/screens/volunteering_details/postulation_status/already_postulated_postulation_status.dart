import 'package:flutter/material.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/postulation_status.dart';

class AlreadyPostulatedPostulationStatus extends StatelessWidget {
  const AlreadyPostulatedPostulationStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      PostulationStatus(
          description:
              'Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este.',
          buttonText: 'Abandonar voluntariado actual',
          onButtonPressed: () => {}),
      SermanosCtaButton(
        text: 'Postularme',
        onPressed: () => {},
        enabled: false,
      ),
    ]);
  }
}
