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
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/l10n/localizations.dart';

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
                    Text(
                      AppLocalizations.of(context)!.volunteer,
                      style: const SermanosTypography.overline(
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
                    title:  AppLocalizations.of(context)!.personalInfo,
                    information: [
                      (
                         AppLocalizations.of(context)!.dateOfBirth,
                        DateFormat.yMd(locale).format(user.birthDate!)
                      ),
                      ( AppLocalizations.of(context)!.gender, genderNameFromEnum(context, user.gender))
                    ]),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: InformationCard(
                    title:  AppLocalizations.of(context)!.contactData,
                    information: [
                      ( AppLocalizations.of(context)!.phonenumber, user.phoneNumber!),
                      ( AppLocalizations.of(context)!.hyphenEmail, user.contactEmail!)
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
                  text:  AppLocalizations.of(context)!.editProfile,
                  onPressed: () => {
                    GoRouter.of(context).pushNamed('editProfile')
                  },
                  backgroundColor: SermanosColors.primary100,
                ),
                const SizedBox(width: 8),
                SermanosCtaButton(
                  text:  AppLocalizations.of(context)!.logout,
                  onPressed: () => GoRouter.of(context).pushNamed('login'),
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
