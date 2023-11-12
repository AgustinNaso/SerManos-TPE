import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ser_manos/config/cellules/information_card.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/molecules/images/profile_image.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/user_model.dart';

class CompleteProfile extends ConsumerWidget {
  final SermanosUser user;

  const CompleteProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              ProfileImage(imageUrl: user.profileImgUrl!),
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
                    Text(
                      user.email,
                      style: const SermanosTypography.body01(
                        color: SermanosColors.secondary200,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: InformationCard(
                    title: 'Información personal',
                    information: [
                      (
                        'fecha de nacimiento',
                        DateFormat.yMd(locale).format(user.birthDate!)
                      ),
                      ('Género', user.gender!.text)
                    ]),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: InformationCard(
                    title: 'Datos de contacto',
                    information: [
                      ('teléfono', user.phoneNumber!),
                      ('e-mail', user.email)
                    ]),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SermanosCtaButton(
                  text: "Editar perfil",
                  onPressed: () => {
                    print("Go to Edit Profile"),

                    GoRouter.of(context).pushNamed('editProfile')
                    // TODO: create and pass user
                  },
                  backgroundColor: SermanosColors.primary100,
                ),
                const SizedBox(width: 8),
                SermanosCtaButton(
                  text: "Cerrar sesión",
                  onPressed: () => Navigator.of(context).pushNamed('login'),
                  backgroundColor: Colors.transparent,
                  textColor: SermanosColors.error100,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
