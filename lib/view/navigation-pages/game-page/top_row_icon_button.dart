import 'package:flutter/material.dart';

class TopRowIconButton extends StatelessWidget {
  Function onPressed;
  IconData icon;

  TopRowIconButton(this.onPressed, this.icon);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        color: Colors.teal,
        padding: EdgeInsets.all(0),
        splashColor: Colors.white,
        icon: Icon(
          icon,
          // color: Colors.lime,
          size: 45,
        ),
        onPressed: () => onPressed,
      ),
    );
  }
}
