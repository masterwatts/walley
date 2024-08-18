import 'package:flutter/material.dart';

/// A utility class for navigating between screens.
class NavigationUtil {
  /// Navigates to the specified [screen] using the given [context].
  static void navigateTo(Widget screen, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }

  /// Navigates to the specified [screen] and removes all previous screens from the stack.
  static void navigateToWithoutBack(Widget screen, BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (Route<dynamic> route) => false,
    );
  }

  /// Pops the current screen from the navigation stack.
  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
