import 'package:flutter/material.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

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
        child: const Center(
          child: Text(
            "No hay voluntariados vigentes para tu busqueda.",
            textAlign: TextAlign.center,
            style: SermanosTypography.subtitle01(
              color: SermanosColors.neutral100,
            ),
          ),
        ),
      ),
    );
  }
}
