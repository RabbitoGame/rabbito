import 'package:flutter/material.dart';

class TopRowIconButton extends StatelessWidget {
  Function onPressed;
  Widget widget;

  TopRowIconButton(this.onPressed, this.widget);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        color: Colors.teal,
        padding: EdgeInsets.all(0),
        splashColor: Colors.white,
        icon: widget,
        onPressed: () => onPressed,
      ),
    );
  }
}
