import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_short_button.dart';
import 'package:ser_manos/config/molecules/images/profile_image.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/providers/upload_image_provider.dart';
import 'package:ser_manos/screens/edit_profile.dart';

class SermanosUploadProfilePhoto extends HookConsumerWidget {
  final List<String? Function(String?)>? validators;
  final String? initialValue;
  final String name;
  final bool enabled;
  final void Function(String, bool)? onChangeFocus;

  const SermanosUploadProfilePhoto({
    Key? key,
    required this.name,
    this.initialValue,
    this.enabled = true,
    this.validators,
    this.onChangeFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myFocusNode = useFocusNode();
    useListenable(myFocusNode);

    final value = useState(initialValue);
    final uploadImageNotifier = ref.read(uploadImageProvider.notifier);

    final bool isEmpty =
        useListenableSelector(value, () => value.value?.isEmpty ?? true);

    return FormBuilderField<String>(
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: name,
      validator: (value) {
        if (validators != null) {
          for (final validator in validators!) {
            final error = validator(value);
            if (error != null) {
              Future(() {
                onChangeFocus?.call(name, false);
              });
              return myFocusNode.hasFocus ? null : error;
            }
          }
          Future(() {
            onChangeFocus?.call(name, true);
          });
        }
        return null;
      },
      builder: (FormFieldState field) {
        value.addListener(() {
          EditProfileFormKey.currentState?.fields[name]?.validate();
          field.didChange(value.value);
        });
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: SermanosColors.secondary25,
              ),
              width: double.infinity,
              child: isEmpty
                  ? Row(
                      children: [
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.profilePicture,
                            style: const SermanosTypography.subtitle01(
                                color: SermanosColors.neutral100),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SermanosShortButton(
                          text: AppLocalizations.of(context)!.uploadPicture,
                          filled: true,
                          onPressed: () async =>
                              await getImage(value, uploadImageNotifier),
                          enabled: enabled,
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.profilePicture,
                              style: const SermanosTypography.subtitle01(
                                  color: SermanosColors.neutral100),
                            ),
                            const SizedBox(height: 8),
                            SermanosCtaButton(
                              text: AppLocalizations.of(context)!.changePicture,
                              onPressed: () async =>
                                  await getImage(value, uploadImageNotifier),
                              enabled: enabled,
                            )
                          ],
                        ),
                        const SizedBox(width: 8),
                        ProfileImage(imageUrl: value.value),
                      ],
                    ),
            ),
            if (field.errorText != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Text(
                  field.errorText!,
                  textAlign: TextAlign.start,
                  style: const SermanosTypography.body01(
                      color: SermanosColors.error100),
                ),
              )
          ],
        );
      },
    );
  }

  Future getImage(
      ValueNotifier value, UploadImageValidator uploadImageNotifier) async {
    uploadImageNotifier.loading();
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxHeight: 1920,
      maxWidth: 1080,
    );

    if (image != null) {
      value.value = image.path;
    }
    uploadImageNotifier.loadingDone();
  }
}
