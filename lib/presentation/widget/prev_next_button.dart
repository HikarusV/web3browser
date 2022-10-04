import 'package:flutter/material.dart';

class PrevNextButton extends StatelessWidget {
  const PrevNextButton({Key? key, this.text = "|", this.onPressed, this.icon})
      : super(key: key);
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          minimumSize: const Size(8, 38),
          maximumSize: const Size(45, 38),
          backgroundColor: Colors.brown.shade400,
          enabledMouseCursor: SystemMouseCursors.basic,
          // disabledMouseCursor: SystemMouseCursors.basic,
        ),
        onPressed: onPressed,
        child: (icon == null)
            ? Text(text)
            : Icon(
                icon,
                size: 14,
              ),
      ),
    );
  }
}
