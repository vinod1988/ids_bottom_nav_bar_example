import 'package:flutter/material.dart';

/// Represents an item in the bottom app bar with active and inactive icons.
class IDSBottomNavBarItem {
  /// Creates an [IDSBottomNavBarItem] with an active icon, optional inactive icon, and text.
  ///
  /// The [activeIcon] is required, while [inActiveIcon] and [text] are optional.
  IDSBottomNavBarItem({
    required this.activeIcon,
    this.inActiveIcon,
    this.text,
  });

  /// The icon displayed when the item is selected.
  final Widget activeIcon;

  /// The icon displayed when the item is not selected.
  final Widget? inActiveIcon;

  /// The text label for the navigation bar item.
  final String? text;
}
