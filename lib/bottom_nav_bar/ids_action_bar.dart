import 'package:flutter/material.dart';

/// A customizable action bar with icons and text for different states.
class IDSActionBar {
  /// Creates an [IDSActionBar] with specified parameters.
  ///
  /// The [activeIcon] is required, while the [inActiveIcon], [text], and
  /// [onTab] are optional.
  IDSActionBar({
    required this.activeIcon,
    this.inActiveIcon,
    this.text,
    this.onTab,
  }) : assert(activeIcon != null, 'activeIcon must not be null');

  /// The icon displayed when the button is selected.
  final Widget activeIcon;

  /// The icon displayed when the button is unselected.
  final Widget? inActiveIcon;

  /// The text label displayed next to the action button.
  final String? text;

  /// The callback function called when the action button is tapped.
  ///
  /// The value passed to the callback is true if the button is selected,
  /// false if it is unselected.
  final ValueChanged<bool>? onTab;
}
