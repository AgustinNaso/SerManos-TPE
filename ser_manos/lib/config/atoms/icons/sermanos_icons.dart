import 'package:flutter/material.dart';

import '../../tokens/sermanos_colors.dart';

class SermanosIcons extends Icon {
  SermanosIcons({
    Key? key,
    required IconData icon,
    required SermanosIconStatus status,
    double size = 24,
  }) : super(
          key: key,
          icon,
          color: status.color,
          size: size,
        );

  SermanosIcons.favoriteFilled({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.favorite,
          status: status,
        );

  SermanosIcons.favoriteOutlined({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.favorite_outline,
          status: status,
        );

  SermanosIcons.person({
    Key? key,
    required SermanosIconStatus status,
  }) : this(key: key, icon: Icons.person, status: status, size: 20);

  SermanosIcons.locationFilled({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.location_on,
          status: status,
        );

  SermanosIcons.locationOutlined({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.location_on_outlined,
          status: status,
        );

  SermanosIcons.back({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.arrow_back,
          status: status,
        );

  SermanosIcons.search({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.search,
          status: status,
        );
  SermanosIcons.map({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.map_outlined,
          status: status,
        );
  SermanosIcons.close({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.close,
          status: status,
        );
  SermanosIcons.calendar({
    Key? key,
    required SermanosIconStatus status,
  }) : this(
          key: key,
          icon: Icons.calendar_month,
          status: status,
        );
  
}

enum SermanosIconStatus {
  enabled(SermanosColors.neutral0),
  enabledSecondary(SermanosColors.neutral75),
  disabled(SermanosColors.neutral25),
  disabledSecondary(SermanosColors.secondary80),
  activated(SermanosColors.primary100),
  activatedSecondary(SermanosColors.secondary200),
  activatedTerciary(SermanosColors.secondary100),
  error(SermanosColors.error100),
  back(SermanosColors.neutral0);

  final Color color;

  const SermanosIconStatus(this.color);
}
