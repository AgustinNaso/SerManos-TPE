import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/config/tokens/sermanos_box_shadows.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';

class SermanosSearchBar extends HookWidget {
  const SermanosSearchBar({super.key, required this.onChange});

  final void Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    const initialValue = '';
    final focusNode = useFocusNode();
    useListenable(focusNode);

    final textController = useTextEditingController(text: initialValue);
    final bool isEmpty = useListenableSelector(
        textController, () => textController.text.isEmpty);

    return Container(
      decoration: BoxDecoration(
        color: SermanosColors.neutral0,
        borderRadius: BorderRadius.circular(2),
        boxShadow: Shadows.shadow1,
      ),
      child: TextField(
        focusNode: focusNode,
        controller: textController,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: 'Buscar',
          hintStyle: const SermanosTypography.subtitle01(
              color: SermanosColors.neutral75),
          prefixIcon: const Icon(
            Icons.search,
            color: SermanosColors.neutral75,
          ),
          suffixIcon: isEmpty
              ? null
              : IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: SermanosColors.neutral75,
                  ),
                  onPressed: () {
                    textController.clear();
                  },
                ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
