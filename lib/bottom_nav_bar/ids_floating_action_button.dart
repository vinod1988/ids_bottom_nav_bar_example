import 'package:flutter/material.dart';

class IDSFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isSelected;
  final Color activeColor;
  final Color inactiveColor;
  final IconData icon;
  final bool enableShadow; // New flag to toggle shadow

  const IDSFloatingActionButton({
    required this.onPressed,
    required this.isSelected,
    required this.activeColor,
    required this.inactiveColor,
    required this.icon,
    this.enableShadow = true, // Default is true (shadow enabled)
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? activeColor : inactiveColor,
          boxShadow: enableShadow
              ? [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ]
              : [], // No shadow when flag is false
        ),
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
