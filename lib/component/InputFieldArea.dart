import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Color borderColor;
  final Color focusBorderColor;
  final Color fillColor;
  final Color textColor;
  InputFieldArea({
    this.controller,
    this.hint,
    this.obscure,
    this.icon,
    this.textInputType,
    this.borderColor,
    this.focusBorderColor,
    this.fillColor,
    this.textColor
  });
  @override
  Widget build(BuildContext context) {
    return (new Container(
      child:  new TextFormField(
        controller: this.controller,
        keyboardType: textInputType,
        obscureText: obscure,
        style: TextStyle(
          color: this.textColor,
        ),
        decoration: new InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: new BorderSide(color: this.borderColor)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: new BorderSide(color: this.focusBorderColor)
          ),
          fillColor: this.fillColor,
          filled: true,
          prefixIcon: Icon(
            icon,
            color: this.textColor,
          ),
          hintText: hint,
          hintStyle: TextStyle(color: this.textColor, fontSize: 15.0),
          contentPadding: const EdgeInsets.only(
              top: 20.0, right: 30.0, bottom: 20.0, left: 5.0),
        ),
      )
    ));
  }
}
