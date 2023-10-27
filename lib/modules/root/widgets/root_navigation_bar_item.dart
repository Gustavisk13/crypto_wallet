// Flutter imports:
import 'package:flutter/material.dart';

class RootNavigationBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  const RootNavigationBarItem({
    required String label,
    required Widget icon,
    required Widget activeIcon,
    required this.initialLocation,
  }) : super(
          label: label,
          icon: icon,
          activeIcon: activeIcon,
        );
}
