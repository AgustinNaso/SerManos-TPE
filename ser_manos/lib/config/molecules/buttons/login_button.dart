import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/cellules/login_form.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/data/models/form_states.dart';
import 'package:ser_manos/data/services/analytics_service.dart';
import 'package:ser_manos/providers/login_controller.dart';
import 'package:ser_manos/providers/login_provider.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool enabled = ref.watch(loginValidatorProvider);
    bool loading =
        ref.watch(loginControllerProvider) == FormStates.loading.name;
    _attendLoginProvider(context, ref);

    return SermanosCtaButton(
        text: AppLocalizations.of(context)!.login,
        enabled: enabled,
        loading: loading,
        onPressed: () {
          _onPressed(context, ref);
        });
  }

  _attendLoginProvider(BuildContext context, WidgetRef ref) {
    final loginStateProvider = ref.watch(loginControllerProvider);

    if (loginStateProvider == FormStates.success.name) {
      getAnalytics().then((value) => value?.logLogin(loginMethod: 'email'));
      Future(() => {GoRouter.of(context).pushReplacementNamed('welcome')});
    }
    if (loginStateProvider == FormStates.loading.name) {
      Future(() => {ref.read(loginValidatorProvider.notifier).loading()});
    }
  }

  _onPressed(BuildContext context, WidgetRef ref) {
    final email = LoginFormKey.currentState!.fields['email']?.value;
    final password = LoginFormKey.currentState!.fields['password']?.value;
    if (email != null && password != null) {
      ref.read(loginControllerProvider.notifier).login(email, password);
    }
  }
}
