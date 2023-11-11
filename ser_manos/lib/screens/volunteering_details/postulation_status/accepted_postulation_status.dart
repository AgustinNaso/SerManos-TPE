import 'package:flutter/material.dart';
import 'package:ser_manos/config/cellules/modal.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/postulation_status.dart';

class AcceptedPostulationStatus extends StatelessWidget {
  final String volunteeringName;
  const AcceptedPostulationStatus({Key? key, required this.volunteeringName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostulationStatus(
        title: 'Estas participando',
        description:
            'La organización confirmó que ya estas participando de este voluntariado',
        buttonText: 'Abandonar voluntariado',
        onButtonPressed: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Modal(
                        title: volunteeringName,
                        subtitle:
                            'Estas seguro que queres abandonar tu voluntariado?',
                        onAccept: () {},
                        primaryButtonText: 'Confirmar',
                        secondaryButtonText: 'Cancelar');
                  })
            });
  }
}
