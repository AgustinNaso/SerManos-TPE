import 'package:flutter/material.dart';
import 'package:ser_manos/config/molecules/vacancies/vacancies.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

class VolunteeringCard extends StatelessWidget {
  const VolunteeringCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 328,
        height: 234,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey, // Shadow color
              spreadRadius: 1, // How far the shadow should spread
              blurRadius: 7, // How blurry the shadow should be
              offset: Offset(0, 1), // Offset in the x and y direction
            ),
          ],
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/Imagen.png'),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                color: Colors.white,
                height: 96,
                width: 328,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          width: 180,
                          color: Colors.green,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('ACCION SOCIAL',
                                  style: SermanosTypography.overline(
                                      color: SermanosColors.neutral[75])),
                              const Text('Un Techo para mi Pais',
                                  style: SermanosTypography.subtitle01()),
                              const SizedBox(height: 4),
                              const Vacancies(vacancy: 10)
                            ],
                          )),
                      Container(
                          color: Colors.red,
                          width: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: SermanosColors.primary,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                alignment: Alignment.bottomCenter,
                                icon: const Icon(
                                  Icons.location_on,
                                  color: SermanosColors.primary,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          )),
                    ]),
              ),
            ]),
      ),
    );
  }
}
