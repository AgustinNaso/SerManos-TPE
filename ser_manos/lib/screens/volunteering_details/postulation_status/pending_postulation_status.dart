import 'package:flutter/material.dart';
import 'package:ser_manos/config/cellules/modal.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/postulation_status.dart';

class PendingPostulationStatus extends StatelessWidget {
  final String volunteeringName;
  const PendingPostulationStatus({Key? key, required this.volunteeringName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostulationStatus(
        title: "Te has postulado",
        description:
            "Pronto la organizacion se pondra en contatcto contigo y te inscribira como participante",
        buttonText: "Retirar postulacion",
        onButtonPressed: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Modal(
                        title: volunteeringName,
                        subtitle:
                            'Estas seguro que queres retirar tu postulacion?',
                        onAccept: () {},
                        primaryButtonText: 'Cancelar',
                        secondaryButtonText: 'Confirmar');
                  })
            });
  }
}
