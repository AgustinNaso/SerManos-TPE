import 'package:flutter/material.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class VolunteeringNotFound extends StatelessWidget {
  const VolunteeringNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 108,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          color: SermanosColors.neutral0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 24,
        ),
        child: Center(
          child: Text(
            AppLocalizations.of(context)!.volunteeringsNotFound,
            textAlign: TextAlign.center,
            style: const SermanosTypography.subtitle01(
              color: SermanosColors.neutral100,
            ),
          ),
        ),
      ),
    );
  }
}
