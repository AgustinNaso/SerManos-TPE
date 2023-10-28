import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

class NewsDetailScreen extends StatelessWidget {
  // static const route = '/news/:id';

  // static String routeFromId(String id) => '/news/$id';

  // static const routeName = 'newsDetail';
  const NewsDetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Novedades',
            style:
                SermanosTypography.subtitle01(color: SermanosColors.primary10),
          ),
          centerTitle: true,
          leading: BackButton(
            color: SermanosColors.primary10,
          ),
          backgroundColor: SermanosColors.secondary100,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Text(
                  'REPORTE 2820', //TODO: source dynamic value
                  style: SermanosTypography(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: SermanosColors.neutral75,
                      letterSpacing: 1.5),
                ),
                Text(
                  'Ser donante voluntario', //TODO: title dynamic value ,
                  style: const SermanosTypography(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: SermanosColors.neutral100,
                      letterSpacing: 0.15),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "assets/images/novedades.png", //TODO: image dynamic value
                    fit: BoxFit.cover,
                    height: 160,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre', //TODO: subtitle dynamic value
                  style: SermanosTypography.subtitle01(
                      color: SermanosColors.secondary200),
                ),
                const SizedBox(height: 16),
                Text(
                  //TODO: body dynamic value
                  'El Hospital Centenario Gualeguaychú, a través de su Servicio de Hemoterapia, recuerda que la donación de sangre es un acto voluntario, altruista y solidario, que no perjudica la salud del donante y que es fundamental para la atención de los pacientes que lo necesitan.\\n El Hospital Centenario Gualeguaychú, a través de su Servicio de Hemoterapia, recuerda que la donación de sangre es un acto voluntario, altruista y solidario, que no perjudica la salud del donante y que es fundamental para la atención de los pacientes que lo necesitan.El Hospital Centenario Gualeguaychú, a través de su Servicio de Hemoterapia, recuerda que la donación de sangre es un acto voluntario, altruista y solidario, que no perjudica la salud del donante y que es fundamental para la atención de los pacientes que lo necesitan.',
                  style: SermanosTypography.defaultBody(),
                ),
                const SizedBox(height: 16),
                Text(
                  'Comparte esta nota',
                  style: SermanosTypography.defaultHeadline(),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SermanosCtaButton(text: 'Compartir', onPressed: () {}),
                )
              ],
            )));
  }
}
