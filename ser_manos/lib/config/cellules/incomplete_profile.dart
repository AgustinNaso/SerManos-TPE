import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/cellules/information_card.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/user_model.dart';

import '../molecules/profile_image.dart';

class IncompleteProfile extends ConsumerWidget {
  final SermanosUser user;

  const IncompleteProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const ProfileImage(),
                const SizedBox(height: 8),
                SizedBox(
                  child: Column(
                    children: [
                      const Text(
                        "Volunteer",
                        style: SermanosTypography.overline(
                          color: SermanosColors.neutral75,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        user.fullName,
                        style: const SermanosTypography.subtitle01(
                          color: SermanosColors.neutral100,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "¡Completá tu perfil para tener acceso a mejores oportunidades!",
                        textAlign: TextAlign.center,
                        style: SermanosTypography.body01(
                          color: SermanosColors.neutral75,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const InformationCard(
                      title: 'title', information: [('test', 'test')]),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SermanosCtaButton(
                        icon: const Icon(Icons.add),
                        text: "Completar",
                        onPressed: () => {
                            
                         GoRouter.of(context).pushNamed('editProfile')// TODO: create and pass user
                        }
                        ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
