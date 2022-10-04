import 'package:flutter/material.dart';

class WindowButton extends StatefulWidget {
  const WindowButton(
      {Key? key,
      this.icons = Icons.minimize,
      this.color = Colors.red,
      this.splashColor = Colors.redAccent,
      this.onPressed})
      : super(key: key);
  final IconData icons;
  final Color color;
  final Color splashColor;
  final VoidCallback? onPressed;

  @override
  State<WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<WindowButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Material(
        color: widget.color,
        borderRadius: BorderRadius.circular(360), // Button color
        child: InkWell(
          customBorder: const CircleBorder(),
          splashColor: widget.splashColor, // Splash color
          onTap: widget.onPressed,
          mouseCursor: SystemMouseCursors.basic,
          onHover: (val) {
            setState(() {
              isHover = val;
            });
          },
          child: SizedBox(
            width: 15,
            height: 15,
            child: Center(
              child: isHover
                  ? Icon(
                      widget.icons,
                      size: 12,
                    )
                  : Container(),
            ),
          ),
        ),
      ),
    );
  }

  MaterialStateProperty<Color> getColorPressed(
      Color color, Color pressedColor) {
    getColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return pressedColor;
      } else {
        return color;
      }
    }

    return MaterialStateProperty.resolveWith(getColor);
  }
}
