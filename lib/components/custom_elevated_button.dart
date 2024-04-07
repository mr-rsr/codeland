import 'package:codeland/res/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    this.fontSize,
    this.width,
    this.height,
    this.color,
    this.fontcolor,
    required this.onPressed,
  });
  final String label;
  final double? fontSize;
  final double? width;
  final double? height;
  final Color? color;
  final Color? fontcolor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4),
        child: Text(
          label,
          style: TextStyle(
            color: fontcolor ?? primaryColor,
            fontSize: fontSize ?? 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
