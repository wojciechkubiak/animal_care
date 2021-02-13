import 'package:flutter/material.dart';
import '../../config/colors.dart';

class Input extends StatelessWidget {
  final String labelText;
  final Color textColor;
  final Color labelColor;
  final Color fillColor;
  final String hintText;
  final Color borderColor;
  final bool obscure;
  final node;
  final double horizontalPadding;

  Input({
    @required this.labelText,
    this.textColor = Colors.white,
    this.labelColor,
    this.fillColor,
    this.hintText,
    this.borderColor,
    this.node,
    this.obscure = false,
    this.horizontalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10),
      child: TextFormField(
        style: TextStyle(color: textColor, fontSize: 18),
        textAlign: TextAlign.center,
        cursorColor: CustomColor.secondaryAccent,
        obscureText: obscure,
        decoration: InputDecoration(
          filled: true,
          focusColor: Colors.red,
          labelText: labelText,
          labelStyle: TextStyle(color: labelColor),
          alignLabelWithHint: true,
          fillColor: fillColor,
          // hintText: "eg. john@mail.com",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor),
          ),
        ),
        onEditingComplete: () => node.nextFocus(),
      ),
    );
  }
}
