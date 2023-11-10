import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ser_manos/config/molecules/buttons/sermanos_cta_button.dart';
import 'package:ser_manos/config/molecules/profile_image.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';


class SermanosUploadProfilePhoto extends ConsumerStatefulWidget {
  const SermanosUploadProfilePhoto({
    Key? key,
    required this.formField,
    required this.initialValue,
    this.enabled = true,
    this.validators,
  }) : super(key: key);

  final String formField;
  final String? initialValue;
  final bool enabled;

  final List<String? Function(String?)>? validators;

  @override
  ConsumerState<SermanosUploadProfilePhoto> createState() => _SermanosPhotoFieldState();
}

class _SermanosPhotoFieldState extends ConsumerState<SermanosUploadProfilePhoto> {
  String? _image;

  @override
  void initState() {
    super.initState();
    _image = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      initialValue: widget.initialValue,
      name: widget.formField,
      validator: FormBuilderValidators.compose(widget.validators ?? []),
      builder: (FormFieldState field) {
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
              child: _image == null
                  ? Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Foto de perfil",
                            style: SermanosTypography.subtitle01(
                                color: SermanosColors.neutral100),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SermanosCtaButton(
                          text: "Subir foto",
                          onPressed: () => print("subir foto"),
                             
                          enabled: widget.enabled,
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Foto de perfil",
                              style: SermanosTypography.subtitle01(
                                  color: SermanosColors.neutral100),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SermanosCtaButton(
                              text: "Cambiar foto",
                              onPressed: () => print("cambiar foto"),
                                  
                              enabled: widget.enabled,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        ProfileImage(
                          imageUrl: _image,
                        )
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

  
}
