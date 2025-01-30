import 'package:flutter/material.dart';
import 'ids_bottom_bar_item.dart';
import 'ids_floating_action_button.dart'; // Assuming you have this file for the custom button

/// A customizable bottom navigation bar with support for a center item and icons.
class IDSBottomNavigationAppBar extends StatefulWidget {
  const IDSBottomNavigationAppBar({
    required this.items,
    this.centerItemText,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.backgroundColor,
    this.inActiveColor,
    this.activeColor,
    this.notchedShape,
    this.onTabSelected,
    this.centerSelected = false,
    this.enableMiddleTabItem = true, // Flag to control middle tab item
    super.key,
  }) : assert(items.length % 2 == 0, 'The items list length must be even.');

  final List<IDSBottomNavBarItem> items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color? inActiveColor;
  final Color? activeColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int>? onTabSelected;
  final bool centerSelected;
  final bool enableMiddleTabItem;

  @override
  IDSBottomNavigationAppBarState createState() =>
      IDSBottomNavigationAppBarState();
}

class IDSBottomNavigationAppBarState extends State<IDSBottomNavigationAppBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    if (widget.onTabSelected != null) {
      widget.onTabSelected!(index);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void changeTab(int index) {
    if (index >= 0 && index < widget.items.length) {
      _updateIndex(index);
    } else {
      throw ArgumentError(
          'Index out of range. Must be between 0 and ${widget.items.length - 1}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Generate navigation bar items
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    // Insert the middle tab item for the center label only if the flag is true
    if (widget.enableMiddleTabItem) {
      items.insert(items.length >> 1, _buildMiddleTabItem());
    }

    return BottomAppBar(
      shape: widget.notchedShape,
      color: widget.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(
                color: widget.centerSelected
                    ? widget.activeColor
                    : widget.inActiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required IDSBottomNavBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index || widget.centerSelected
        ? widget.activeColor!
        : widget.inActiveColor!;
    Widget? icon = _selectedIndex == index || widget.centerSelected
        ? item.activeIcon
        : item.inActiveIcon;

    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon!,
                Text(
                  item.text!,
                  style: TextStyle(color: color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
