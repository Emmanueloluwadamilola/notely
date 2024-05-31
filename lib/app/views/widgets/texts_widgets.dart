import 'package:flutter/material.dart';
import 'package:notely/app/style/style.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppStrings.appTitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: Fonts.titan,
        fontSize: 20,
        color: AppColor.titleColor,
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.fontColor,
      required this.fontFamily, required this.textAlign});
  final String? title;
  final double fontSize;
  final Color fontColor;
  final String fontFamily;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }
}
