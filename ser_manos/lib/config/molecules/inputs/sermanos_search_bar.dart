import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/tokens/sermanos_box_shadows.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/providers/search_bar_controller.dart';

class SermanosSearchBar extends HookConsumerWidget {
  const SermanosSearchBar({super.key, required this.onSubmit});

  final void Function(String) onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        boxShadow: SermanosShadows.shadow1,
      ),
      child: TextField(
        focusNode: focusNode,
        controller: textController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          hintText: AppLocalizations.of(context)!.search,
          hintStyle: const SermanosTypography.subtitle01(
              color: SermanosColors.neutral75),
          prefixIcon: !isEmpty
              ? null
              : SermanosIcons.search(
                  status: SermanosIconStatus.enabledSecondary),
          suffixIcon: isEmpty
              ? SermanosIcons.map(status: SermanosIconStatus.activated)
              : IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: SermanosColors.neutral75,
                  ),
                  onPressed: () {
                    textController.clear();
                    ref
                        .watch(searchBarControllerProvider.notifier)
                        .search(null);
                  },
                ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
        onTapOutside: (event) => focusNode.unfocus(),
        onEditingComplete: () => focusNode.unfocus(),
        onSubmitted: onSubmit,
      ),
    );
  }
}
