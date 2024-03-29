import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      this.trailing,
      this.leading,
      this.onTap});

  final String title;
  final Widget? trailing;
  final Widget? leading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: onTap,
        dense: true,
        visualDensity: const VisualDensity(vertical: -1),
        iconColor: Colors.white,
        textColor: Colors.white,
        minLeadingWidth: 10,
        leading: leading,
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        trailing: trailing,
        tileColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
