import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color mainColor;
  final Color borderColor;
  final String buttonText;
  final double padding;
  final double opacity;
  final double borderWidth;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.mainColor,
    required this.buttonText,
    required this.padding,
    required this.opacity,
    required this.borderColor,
    required this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0), side: BorderSide(color: borderColor, width: borderWidth)),
          backgroundColor: Colors.transparent.withOpacity(opacity),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            color: mainColor,
            letterSpacing: 1.4,
          ),
        ),
      ),
    );
  }
}
