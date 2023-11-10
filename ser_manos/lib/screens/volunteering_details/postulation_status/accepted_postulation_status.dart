import 'package:flutter/material.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/postulation_status.dart';

class AcceptedPostulationStatus extends StatelessWidget {
  const AcceptedPostulationStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostulationStatus(
        title: 'Estas participando',
        description:
            'La organización confirmó que ya estas participando de este voluntariado',
        buttonText: 'Abandonar voluntariado',
        onButtonPressed: () => {});
  }
}
