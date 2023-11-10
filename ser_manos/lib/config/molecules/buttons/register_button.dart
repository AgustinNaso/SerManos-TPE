import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/cellules/register_form.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/providers/register_controller.dart';
import 'package:ser_manos/providers/register_provider.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class RegisterButton extends ConsumerWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool enabled = ref.watch(registerValidatorProvider);
    _attendRegisterProvider(context, ref);

    return SermanosCtaButton(
        text: AppLocalizations.of(context)!.signup,
        enabled: enabled,
        onPressed: () {
          _onPressed(context, ref);
        });
  }

  _attendRegisterProvider(BuildContext context, WidgetRef ref) {
    final registerStateProvider = ref.watch(registerControllerProvider);

    if (registerStateProvider == RegisterStates.success.name) {
      Future(() => {GoRouter.of(context).pushReplacementNamed('welcome')});
    }
    if (registerStateProvider == RegisterStates.loading.name) {
      Future(() => {ref.read(registerValidatorProvider.notifier).loading()});
    }
  }

  _onPressed(BuildContext context, WidgetRef ref) {
    final email = RegisterFormKey.currentState!.fields['email']?.value;
    final password = RegisterFormKey.currentState!.fields['password']?.value;
    final name = RegisterFormKey.currentState!.fields['name']?.value;
    final lastName = RegisterFormKey.currentState!.fields['lastName']?.value;
    if (email != null && password != null && name != null && lastName != null) {
      ref
          .read(registerControllerProvider.notifier)
          .register(email, password, name, lastName);
    }
  }
}
