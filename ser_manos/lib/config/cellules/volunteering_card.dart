import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/molecules/vacancies/vacancies.dart';
import 'package:ser_manos/config/tokens/sermanos_box_shadows.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/volunteering_model.dart';

class VolunteeringCard extends StatelessWidget {
  final Volunteering volunteeringInfo;
  final bool isFavorite;

  const VolunteeringCard(
      {super.key, required this.volunteeringInfo, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push('/volunteering/${volunteeringInfo.id}');
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
                Image.network(volunteeringInfo.imgUrl,
                    width: 328, height: 138, fit: BoxFit.cover),
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(volunteeringInfo.category,
                                style: SermanosTypography.overline(
                                    color: SermanosColors.neutral75)),
                            Text(volunteeringInfo.name,
                                style: SermanosTypography.subtitle01()),
                            SizedBox(height: 4),
                            Vacancies(vacancy: volunteeringInfo.vacancies)
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              constraints: const BoxConstraints(),
                              icon: SermanosIcons.favoriteOutlined(
                                  status: SermanosIconStatus.activated),
                              onPressed: () {},
                            ),
                            IconButton(
                              alignment: Alignment.bottomCenter,
                              icon: SermanosIcons.locationOutlined(
                                  status: SermanosIconStatus.activated),
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
