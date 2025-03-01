import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  final VoidCallback onPressed;
  final Color backGroundColor;
  final FontWeight fontWeight;
  final double iconSize;
  final Color iconColor;
  final double elevation;
  final bool isBorderSameColor;
  final double borderRadius;
  const CustomIconButton({
    this.width = double.infinity,
    this.height = 55,
    required this.onPressed,
    required this.icon,
    this.fontWeight = FontWeight.w700,
    this.iconSize = 25,
    this.backGroundColor = Colors.deepOrange,
    this.iconColor = Colors.white,
    this.elevation = 2.0,
    super.key,
    this.isBorderSameColor = true,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: iconColor,
          backgroundColor: backGroundColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            side: BorderSide(width:2,color: isBorderSameColor ? backGroundColor:iconColor),
          ),
          iconColor: iconColor,
          iconSize: iconSize,
        ),
        child: Icon(icon)
      ),
    );
  }
}

