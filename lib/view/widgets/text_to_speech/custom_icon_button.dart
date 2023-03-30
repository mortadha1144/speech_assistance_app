import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon, this.isLoading = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: onPressed,
        //() async {
        //   await provider.speechTheText();
        // },
        icon: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.black87,
                ))
            : Icon(
                icon,
                size: 30,
              ),
      ),
    );
  }
}
