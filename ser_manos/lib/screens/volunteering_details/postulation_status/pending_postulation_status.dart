import 'package:flutter/cupertino.dart';
import 'package:ser_manos/screens/volunteering_details/postulation_status/postulation_status.dart';

class PendingPostulationStatus extends StatelessWidget {
  const PendingPostulationStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostulationStatus(
        title: "Te has postulado",
        description:
            "Pronto la organizacion se pondra en contatcto contigo y te inscribira como participante",
        buttonText: "Retirar postulacion",
        onButtonPressed: () => {});
  }
}
