import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

BottomNavigationBarItem navBarIcon(icon, label) {
  return BottomNavigationBarItem(
    icon: Image.asset(
      'assets/images/$icon.png',
      height: 20,
      width: 20,
      color: grey,
    ),
    activeIcon: Image.asset(
      'assets/images/$icon.png',
      height: 20,
      width: 20,
      color: primaryBlue,
    ),
    label: '$label',
  );
}
