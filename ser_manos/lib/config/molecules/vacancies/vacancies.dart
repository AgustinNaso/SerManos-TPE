import 'package:flutter/material.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';

class Vacancies extends StatelessWidget {
  const Vacancies({
    super.key,
    required this.vacancy,
  });

  final int vacancy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      decoration: BoxDecoration(
          color: Colors.lightBlue[100],
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Vacantes: '),
          const Icon(Icons.person, color: SermanosColors.secondary),
          Text(vacancy.toString()),
        ],
      ),
    );
  }
}
