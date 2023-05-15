import 'package:flutter/material.dart';

class CustomNavBarIcon extends StatelessWidget {
  const CustomNavBarIcon(
      {super.key, required this.enable, required this.icon, this.onPress});

  final bool enable;
  final IconData icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return enable
        ? IconButton(
            iconSize: 32,
            constraints: const BoxConstraints(maxWidth: 32),
            padding: EdgeInsets.zero,
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            onPressed: onPress,
          )
        : const SizedBox(
            width: 32,
          );
  }
}
