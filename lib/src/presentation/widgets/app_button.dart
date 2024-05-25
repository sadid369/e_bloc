// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final double? textFontSize;
  final IconData? rightLogo;
  final IconData? leftLogo;
  final double logoSize;
  final Color textColor;
  final FontWeight fontWeight;
  final Color borderColor;
  final double borderWidth;
  final Color bg;
  final double radius;
  final VoidCallback onTap;
  const AppButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    this.textFontSize = null,
    this.logoSize = 0,
    this.rightLogo,
    this.leftLogo,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    required this.bg,
    this.radius = 0,
    this.fontWeight = FontWeight.normal,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bg,
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(
            radius,
          ),
        ),
        width: width,
        height: height,
        child: Center(
          child: Row(
            mainAxisAlignment: leftLogo == null && rightLogo == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftLogo == null
                  ? Container()
                  : Icon(
                      leftLogo,
                      size: logoSize,
                    ),
              Text(
                textAlign: TextAlign.center,
                text,
                style: TextStyle(
                  fontSize: textFontSize,
                  color: textColor,
                  fontWeight: fontWeight,
                ),
              ),
              rightLogo == null
                  ? Container()
                  : Icon(
                      rightLogo,
                      size: logoSize,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
