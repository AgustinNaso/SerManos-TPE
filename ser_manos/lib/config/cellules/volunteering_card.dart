import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/atoms/icons/sermanos_icons.dart';
import 'package:ser_manos/config/molecules/images/sermanos_cached_network_image.dart';
import 'package:ser_manos/config/molecules/vacancies/vacancies.dart';
import 'package:ser_manos/config/tokens/sermanos_box_shadows.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/config/tokens/sermanos_typography.dart';
import 'package:ser_manos/data/models/volunteering_model.dart';
import 'package:ser_manos/providers/analytics_provider.dart';
import 'package:ser_manos/providers/user_provider.dart';

class VolunteeringCard extends ConsumerWidget {
  final Volunteering volunteeringInfo;

  const VolunteeringCard({super.key, required this.volunteeringInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref
        .read(loggedUserProvider)!
        .favVolunteerings
        .contains(volunteeringInfo.id);

    return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed('volunteering',
            pathParameters: {'id': volunteeringInfo.id});
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: SermanosShadows.shadow1,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SermanosCachedNetworkImage(
                  imageUrl: volunteeringInfo.imgUrl, height: 138),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                color: Colors.white,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(volunteeringInfo.category,
                          style: const SermanosTypography.overline(
                              color: SermanosColors.neutral75)),
                      Text(volunteeringInfo.name,
                          style: const SermanosTypography.subtitle01()),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Vacancies(vacancy: volunteeringInfo.vacancies),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                constraints: const BoxConstraints(),
                                icon: isFavorite
                                    ? SermanosIcons.favoriteFilled(
                                        status: SermanosIconStatus.activated)
                                    : SermanosIcons.favoriteOutlined(
                                        status: SermanosIconStatus.activated),
                                onPressed: () =>
                                    handleFavoriteButton(ref, isFavorite),
                              ),
                              const SizedBox(width: 16),
                              IconButton(
                                // constraints: BoxConstraints.tight(const Size.square(24)),
                                alignment: Alignment.bottomCenter,
                                icon: SermanosIcons.locationFilled(
                                    status: SermanosIconStatus.activated),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
              ),
            ]),
      ),
    );
  }

  handleFavoriteButton(WidgetRef ref, bool isFavorite) async {
    if (isFavorite) {
      ref
          .read(loggedUserProvider.notifier)
          .removeFavVolunteering(volunteeringInfo.id);
      getAnalytics().then((value) => value?.logEvent(
          name: 'remove_favorite_test', parameters: {'volunteering_id': volunteeringInfo.id}));
    } else {
      ref
          .read(loggedUserProvider.notifier)
          .addFavVolunteering(volunteeringInfo.id);
      getAnalytics().then((value) async {
        await value?.logEvent(
            name: 'add_favorite_test', parameters: {'volunteering_id': volunteeringInfo.id});
      });
    }
  }
}
