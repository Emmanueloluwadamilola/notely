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
          fontFamily: Fonts.titan, fontSize: 20, color: AppColor.titleColor),
    );
  }
}

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontFamily: Fonts.nunitoBlack,
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: AppColor.titleColor),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText({super.key, required this.title, required this.fontSize});
  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: Fonts.nunitoBold,
          fontSize: fontSize,
          color: AppColor.textColor),
    );
  }
}
