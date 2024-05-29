import 'package:flutter/material.dart';
import 'package:notely/app/app.dart';
import 'package:notely/features/auth/presentation/manager/auth_provider.dart';
import 'package:notely/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),],
      child: MaterialApp(
        title: 'Notely',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Scaffold(
          backgroundColor: AppColor.background,
          body:  OnboardingScreen()),
      ),
    );
  }
}

