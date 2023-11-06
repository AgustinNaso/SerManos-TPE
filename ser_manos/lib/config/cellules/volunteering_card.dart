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
      child: Container(
        decoration: BoxDecoration(
          boxShadow: Shadows.shadow1,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(volunteeringInfo.imgUrl,
                    width: double.infinity, height: 138, fit: BoxFit.cover),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  color: Colors.white,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(volunteeringInfo.category,
                            style: const SermanosTypography.overline(
                                color: SermanosColors.neutral75)),
                        Text(volunteeringInfo.name,
                            style: const SermanosTypography.subtitle01()),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Vacancies(vacancy: volunteeringInfo.vacancies),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  constraints: const BoxConstraints(),
                                  icon: SermanosIcons.favoriteOutlined(
                                      status: SermanosIconStatus.activated),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  alignment: Alignment.bottomCenter,
                                  icon: SermanosIcons.locationFilled(
                                      status: SermanosIconStatus.activated),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        )
                      ]),
                ),
              ]),
        ),
      ),
    );
  }
}
