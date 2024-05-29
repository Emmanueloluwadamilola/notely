import 'package:flutter/material.dart';
import 'package:notely/app/app.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 190,
        ),
        const Spacer(),
        BodyText(
            title: title,
            fontSize: 20,
            fontColor: AppColor.titleColor,
            fontFamily: Fonts.nunitoBlack),
        const Spacer(),
        BodyText(
          title: description,
          fontSize: 16,
          fontColor: AppColor.textColor,
          fontFamily: Fonts.nunitoBold,
        ),
      ],
    );
  }
}
