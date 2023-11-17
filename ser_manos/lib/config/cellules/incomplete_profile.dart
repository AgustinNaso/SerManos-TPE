import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../molecules/images/profile_image.dart';

class IncompleteProfile extends ConsumerWidget {
  final SermanosUser user;

  const IncompleteProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const ProfileImage(size: 120),
              const SizedBox(height: 16),
              SizedBox(
                child: Column(
                  children: [
                     Text(
                      AppLocalizations.of(context)!.volunteer.toUpperCase(),
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
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 60),
                      child: Text(
                        AppLocalizations.of(context)!.completeProfile,
                        textAlign: TextAlign.center,
                        style: const SermanosTypography.body01(
                          color: SermanosColors.neutral75,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SermanosCtaButton(
                      icon: const Icon(Icons.add),
                      text: AppLocalizations.of(context)!.complete,
                      onPressed: () => {
                            GoRouter.of(context).pushNamed('editProfile')
                            // TODO: create and pass user
                          }),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
