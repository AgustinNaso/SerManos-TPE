import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/molecules/vacancies/vacancies.dart';
import 'package:ser_manos/config/tokens/sermanos_box_shadows.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

class VolunteeringCard extends StatelessWidget {
  const VolunteeringCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push('/volunteering');
      },
      child: Center(
        child: Container(
          width: 328,
          height: 234,
          decoration: BoxDecoration(
            boxShadow: Shadows.shadow1,
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
                        const Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('ACCION SOCIAL',
                                style: SermanosTypography.overline(
                                    color: SermanosColors.neutral75)),
                            Text('Un Techo para mi Pais',
                                style: SermanosTypography.subtitle01()),
                            SizedBox(height: 4),
                            Vacancies(vacancy: 10)
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: const Icon(
                                Icons.favorite_border,
                                color: SermanosColors.primary100,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              alignment: Alignment.bottomCenter,
                              icon: const Icon(
                                Icons.location_on,
                                color: SermanosColors.primary100,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ]),
                ),
              ]),
        ),
      ),
    );
  }
}
