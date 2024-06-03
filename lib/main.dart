import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notely/app/app.dart';
import 'package:notely/features/auth/presentation/manager/auth_provider.dart';
import 'package:notely/features/auth/presentation/pages/sign_in.dart';
import 'package:notely/features/auth/presentation/pages/sign_up.dart';
import 'package:notely/features/home/domain/note.dart';
import 'package:notely/features/home/presentation/manager/note_provider.dart';
import 'package:notely/features/home/presentation/pages/add_note.dart';
import 'package:notely/features/home/presentation/pages/all_note.dart';
import 'package:notely/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:notely/features/settings/presentation/manager/setting_provider.dart';
import 'package:provider/provider.dart';

import 'boxes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  noteBox = await Hive.openBox<NoteModel>('personBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => NoteProvider()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),
      ],
      child: MaterialApp(
        title: 'Notely',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Scaffold(
          backgroundColor: AppColor.background,
          body: OnboardingScreen(),
          // floatingActionButton: ,
        ),
        onGenerateRoute: _generateRoute,
      ),
    );
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignIn.id:
        return settings.route(const SignIn());
      case SignUp.id:
        return settings.route(const SignUp());
      case AllNoteScreen.id:
        return settings.route(const AllNoteScreen());
      case OnboardingScreen.id:
        return settings.route(const OnboardingScreen());
      case AddNoteScreen.id:
        return settings.route(const AddNoteScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

extension MyRoute on RouteSettings {
  PageRoute route(child) {
    return MaterialPageRoute(
      settings: RouteSettings(
        name: name,
      ),
      builder: (_) => child!,
    );
  }
}
