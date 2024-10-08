import 'package:flutter/material.dart';
import 'package:notely/app/app.dart';
import 'package:gap/gap.dart';
import 'package:notely/features/home/presentation/pages/home_screen.dart';
import 'package:notely/features/onboarding/domain/onboard.dart';
import 'package:notely/features/onboarding/presentation/manager/onboarding_provider.dart';
import 'package:notely/features/onboarding/presentation/widget/dot_indicator.dart';
import 'package:notely/features/onboarding/presentation/widget/onboard_content.dart';
import 'package:provider/provider.dart';

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
      title: AppStrings.onboardingTextMain_3,
      description: AppStrings.onboardingTextBody_3),
];

class OnboardingScreen extends StatefulWidget {
  static const String id = 'onBoarding';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  OnboardingProvider? _provider;
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (_, provider, __) {
        _provider ??= provider;
        return Scaffold(
          backgroundColor: AppColor.background,
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(25),
                  const AppTitle(),
                  const Gap(100),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: screens.length,
                      onPageChanged: (value) => setState(() {
                        pageIndex = value;
                      }),
                      itemBuilder: (context, index) => OnboardContent(
                          image: screens[index].image,
                          title: screens[index].title,
                          description: screens[index].description),
                    ),
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      screens.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: DotIndicator(
                          isActive: index == pageIndex,
                        ),
                      ),
                    ),
                  ),
                  const Gap(40),
                  MainButton(
                    buttonText: AppStrings.getStarted,
                    disabled: pageIndex < 2,
                    loading: false,
                    callback: () async {
                      await provider.setOnboarding();
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                  ),
                  
                ]),
          ),
        );
      },
    );
  }
}
