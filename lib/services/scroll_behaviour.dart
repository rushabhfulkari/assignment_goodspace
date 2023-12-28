import 'package:flutter/material.dart';

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

ScrollConfiguration returnScrollConfigation(Widget? child) {
  return ScrollConfiguration(
    behavior: MyBehavior(),
    child: child ?? Container(),
  );
}
