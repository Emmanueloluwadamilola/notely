import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notely/app/app.dart';
import 'package:notely/features/home/presentation/pages/home_screen.dart';
import 'package:notely/features/onboarding/presentation/manager/splash_provider.dart';
import 'package:notely/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashProvider? _provider;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _provider?.listen((event) {
        if (event == 0) {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => const OnboardingScreen(),
            ),
          );
        } else if (event == 1) {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (_, provider, __) {
        _provider ??= provider;
        return Scaffold(
          backgroundColor: AppColor.background,
          body: Center(
            child: DefaultTextStyle(
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColor.titleColor,
                fontSize: 30.0,
                fontFamily: Fonts.titan,
              ),
              child: AnimatedTextKit(
                // pause: const Duration(seconds: 3),
                animatedTexts: [
                  TypewriterAnimatedText(AppStrings.appTitle,
                      speed: Duration(milliseconds: 300)),
                ],
                onTap: () {},
              ),
            ),
            // Text(
            //   AppStrings.appTitle,
            //   style: TextStyle(
            //       fontFamily: Fonts.titan,
            //       fontSize: 30,
            //       color: AppColor.titleColor),
            // ),
          ),
        );
      },
    );
  }
}
