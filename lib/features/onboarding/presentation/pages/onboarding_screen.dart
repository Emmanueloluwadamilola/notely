import 'package:flutter/material.dart';
import 'package:notely/app/app.dart';
import 'package:gap/gap.dart';
import 'package:notely/features/onboarding/domain/onboard.dart';

List<OnBoard> screens = [
  OnBoard(
      image: ImageAsset.onboarding,
      title: AppStrings.onboardingTextMain,
      description: AppStrings.onboardingTextBody),
  OnBoard(
      image: ImageAsset.firstNote,
      title: AppStrings.onboardingTextMain_2,
      description: AppStrings.onboardingTextBody_2),
  OnBoard(
      image: ImageAsset.premium,
      title: AppStrings.onboardingTextBody_3,
      description: AppStrings.onboardingTextBody_3),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(30),
              const AppTitle(),
              const Gap(90),
              Image.asset(ImageAsset.onboarding),
              const Gap(10),
              const ScreenTitle(title: AppStrings.onboardingTextMain),
              const Gap(10),
              const BodyText(title: AppStrings.onboardingTextBody, fontSize: 16)
            ],
          ),
        ),
      ),
    );
  }
}
