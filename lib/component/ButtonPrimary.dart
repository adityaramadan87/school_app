import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final VoidCallback onPressed;
  final String titleButton;
  final Color textColor, buttonColor;
  ButtonPrimary({this.onPressed, this.titleButton, this.textColor, this.buttonColor});
  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      child: Text(
        titleButton,
        style: new TextStyle(
          color: this.textColor,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
      onPressed: onPressed,
      color: this.buttonColor,
      hoverColor: Colors.white,
      splashColor: Colors.indigoAccent,
      focusColor: Colors.indigoAccent,
//      highlightedBorderColor: Colors.red,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
      ),
    );
  }
}
