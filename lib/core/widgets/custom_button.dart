import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;
  final Color backGroundColor;
  final FontWeight fontWeight;
  final double fontSize;
  final double wordSpacing;
  final double letterSpacing;
  final Color textColor;
  final double elevation;
  final bool isBorderSameColor;
  final double borderRadius;
  final bool isDefault;
  final TextStyle style;
   const CustomButton({
    this.width = double.infinity,
    this.height = 55,
    required this.onPressed,
    required this.text,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 15,
    this.wordSpacing = 1,
    this.letterSpacing = 1,
    this.backGroundColor = Colors.deepOrange,
    this.textColor = Colors.white,
    this.elevation = 2.0,
    super.key,
    this.isBorderSameColor = true,
    this.borderRadius = 8,
    this.isDefault = true,
    this.style = const TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w700
    ),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backGroundColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            side: BorderSide(width:2,color: isBorderSameColor ? backGroundColor:textColor),
          ),
          textStyle: isDefault? TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
              wordSpacing: wordSpacing,
              letterSpacing: letterSpacing)
          :style,
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
