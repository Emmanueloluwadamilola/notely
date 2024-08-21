
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notely/app/app.dart';
import 'package:notely/config/di/injector_container.dart';
import 'package:notely/features/home/domain/model/note.dart';
import 'package:notely/features/home/presentation/manager/note_provider.dart';
import 'package:notely/features/home/presentation/pages/add_note.dart';
import 'package:notely/features/home/presentation/pages/all_note.dart';
import 'package:notely/features/home/presentation/pages/home_screen.dart';
import 'package:notely/features/home/presentation/pages/pick_image_screen.dart';
import 'package:notely/features/home/presentation/pages/voice_to_text.dart';
import 'package:notely/features/onboarding/presentation/manager/onboarding_provider.dart';
import 'package:notely/features/onboarding/presentation/manager/splash_provider.dart';
import 'package:notely/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:notely/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:notely/features/settings/presentation/manager/setting_provider.dart';
import 'package:notely/features/settings/presentation/pages/setting.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<NoteProvider>()),
        ChangeNotifierProvider(create: (_) => sl<SettingProvider>()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      child: MaterialApp(
        title: 'Notely',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        onGenerateRoute: _generateRoute,
      ),
    );
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.id:
        return settings.route(const HomeScreen());

      case AllNoteScreen.id:
        return settings.route(const AllNoteScreen());
      case OnboardingScreen.id:
        return settings.route(const OnboardingScreen());
      case AddNoteScreen.id:
        final args = settings.arguments as AddNoteScreen;
        return settings.route(
          AddNoteScreen(
            isUpdate: args.isUpdate,
            index: args.index,
            note: args.note,
          ),
        );
      case PickImageScreen.id:
        return settings.route(const PickImageScreen());
      case VoiceToTextScreen.id:
        return settings.route(const VoiceToTextScreen());
      case SettingScreen.id:
        return settings.route(const SettingScreen());

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
