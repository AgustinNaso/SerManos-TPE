import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/cellules/modal.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/data/models/volunteering_details_model.dart';
import 'package:ser_manos/data/models/volunteering_postulation.dart';
import 'package:ser_manos/providers/repository_provider.dart';
import 'package:ser_manos/providers/user_provider.dart';

class DefaultPostulationStatus extends StatelessWidget {
  final VolunteeringDetails volunteeringDetails;
  const DefaultPostulationStatus({Key? key, required this.volunteeringDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool canPostulate = volunteeringDetails.vacancies > 0;
    return Consumer(builder: (context, ref, child) {
      final loggedUser = ref.watch(loggedUserProvider)!;

      return Column(children: [
        if (!canPostulate)
          Column(
            children: [
              Text(
                AppLocalizations.of(context)!.noVacancy,
                style: const SermanosTypography.body01(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
            ],
          ),
        SermanosCtaButton(
            text: AppLocalizations.of(context)!.apply,
            onPressed: () async {
              if (loggedUser.isProfileFilled() ||
                  await showUncompleteProfileDialog(context, ref)) {
                print("context.mounted: ${context.mounted}");
                if (context.mounted) {
                  print('mounted');
                  showCompleteProfileDialog(context, ref);
                }
              }
            },
            enabled: canPostulate)
      ]);
    });
  }

  void showCompleteProfileDialog(BuildContext context, WidgetRef ref) async {
    final loggedUser = ref.watch(loggedUserProvider)!;
    await showDialog<bool?>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Modal(
            title: volunteeringDetails.name,
            subtitle:
                AppLocalizations.of(context)!.defaultPostulateModalSubtitle,
            onAccept: () =>
                handlePostulation(ref, loggedUser.id, volunteeringDetails),
            primaryButtonText: AppLocalizations.of(context)!.confirm,
            secondaryButtonText: AppLocalizations.of(context)!.cancel));
  }

  Future<bool> showUncompleteProfileDialog(
      BuildContext context, WidgetRef ref) async {
    bool isCompleted = false;
    if (context.mounted) {
      await showDialog<bool?>(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => Modal(
              subtitle:
                  AppLocalizations.of(context)!.uncompleteProfileModalSubtitle,
              onAccept: () async {
                bool? success =
                    await GoRouter.of(context).pushNamed('editProfile');
                if (success != null) {
                  print("CABERN : $success");
                  isCompleted = success;
                }
                print('success: $isCompleted');
              },
              primaryButtonText: AppLocalizations.of(context)!.confirm,
              secondaryButtonText: AppLocalizations.of(context)!.cancel));
    }
    return isCompleted;
  }

  void handlePostulation(
      WidgetRef ref, String uid, VolunteeringDetails volunteeringDetails) {
    VolunteeringPostulation postulation = VolunteeringPostulation(
        volunteeringId: volunteeringDetails.volunteeringId,
        status: VolunteeringPostulationStatus.pending);
    ref
        .read(userRepositoryProvider)
        .updateUser(uid, {"volunteeringPostulation": postulation}).then(
            (value) => ref
                .read(loggedUserProvider.notifier)
                .setVolunteeringPostulation(postulation));
  }
}
