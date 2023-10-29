import 'package:flutter/material.dart';
import 'package:ser_manos/config/cellules/volunteering_card.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

import '../config/tokens/sermanos_colors.dart';

class PostulateScreen extends StatelessWidget {
  const PostulateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text("Voluntariados",
                  style: SermanosTypography.headline01(
                      color: SermanosColors.neutral100)),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                      itemBuilder: (context, index) {
                        return const VolunteeringCard();
                      },
                      itemCount: 5)),
              SizedBox(height: 16)
            ]));
  }
}
