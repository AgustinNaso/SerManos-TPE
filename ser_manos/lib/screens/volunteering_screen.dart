import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/molecules/vacancies/vacancies.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

class VolunteeringScreen extends StatelessWidget {
  const VolunteeringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(children: [
            Container(
                width: double.infinity,
                height: 243,
                child: Image.asset(
                  'assets/images/Imagen2.png',
                  fit: BoxFit.cover,
                )),
            Positioned.fill(
                child: Container(
                    decoration: const BoxDecoration(
              color: SermanosColors.neutral0,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [SermanosColors.neutral200, Colors.transparent],
                stops: [0.0, 0.3],
              ),
            ))),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                  onPressed: () => {GoRouter.of(context).pop()},
                  icon: SermanosIcons.back(status: SermanosIconStatus.back)),
            )
          ]),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ACCION SOCIAL',
                      style: SermanosTypography.overline(
                          color: SermanosColors.neutral75)),
                  const Text('Un Techo para mi Pais',
                      style: SermanosTypography.headline01()),
                  const SizedBox(height: 16),
                  const Text(
                      'El propósito principal de "Un techo para mi país" es reducir el déficit habitacional y mejorar las condiciones de vida de las personas que no tienen acceso a una vivienda adecuada.',
                      style: SermanosTypography.body01(
                          color: SermanosColors.secondary200)),
                  const SizedBox(height: 24),
                  const Text('Sobre la actividad',
                      style: SermanosTypography.defaultHeadline()),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                      'La actividad consiste en la construcción de viviendas de emergencia para familias que viven en asentamientos precarios.',
                      style: SermanosTypography.body01()),
                  const SizedBox(height: 24),
                  ColoredBox(
                    color: SermanosColors.secondary50,
                    child: Container(height: 247),
                  ),
                  const SizedBox(height: 24),
                  const Text('Participar del voluntariado',
                      style: SermanosTypography.defaultHeadline()),
                  const SizedBox(height: 8),
                  const Text('Requisitos',
                      style: SermanosTypography.subtitle01()),
                  const SizedBox(height: 8),
                  ListView.builder(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: SermanosColors.neutral100,
                            size: 5,
                          ),
                          SizedBox(width: 8),
                          Text('Ser mayor de 18 años',
                              style: SermanosTypography.body01()),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  const Text('Disponibilidad',
                      style: SermanosTypography.subtitle01()),
                  const SizedBox(height: 8),
                  ListView.builder(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: SermanosColors.neutral100,
                            size: 5,
                          ),
                          SizedBox(width: 8),
                          Text('Ser mayor de 18 años',
                              style: SermanosTypography.body01()),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  const Vacancies(vacancy: 10),
                  const SizedBox(height: 24),
                  SermanosCtaButton(text: 'Postularme', onPressed: () {})
                ],
              ))
        ],
      ),
    ));
  }
}
