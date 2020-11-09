import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Color buttonColor;
  final Color textColor;
  final Function onClick;

  const CustomButton({
    Key key,
    this.text = "Button",
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClick != null ? onClick : () {},
      child: Text(
        text,
        style: TextStyle(
            color: textColor
        ),
      ),
      color: buttonColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0)
      ),
    );
  }
}