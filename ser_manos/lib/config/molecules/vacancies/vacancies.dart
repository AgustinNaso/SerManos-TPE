import 'package:flutter/material.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

class Vacancies extends StatelessWidget {
  const Vacancies({
    super.key,
    required this.vacancy,
  });

  final int vacancy;

  @override
  Widget build(BuildContext context) {
    final bool hasVacancy = vacancy > 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: hasVacancy
              ? SermanosColors.secondary25
              : SermanosColors.neutral25,
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Vacantes: ',
              style:
                  SermanosTypography.body02(color: SermanosColors.neutral100)),
          SermanosIcons.person(
              status: hasVacancy
                  ? SermanosIconStatus.activatedSecondary
                  : SermanosIconStatus.disabledSecondary),
          Text(
            vacancy.toString(),
            style: SermanosTypography.subtitle01(
                color: hasVacancy
                    ? SermanosColors.secondary200
                    : SermanosColors.secondary80),
          )
        ],
      ),
    );
  }
}
