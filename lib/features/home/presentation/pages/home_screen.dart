import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:notely/app/app.dart';
import 'package:notely/config/di/injector_container.dart';
import 'package:notely/features/home/presentation/pages/all_note.dart';
import 'package:notely/features/settings/presentation/pages/setting.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = sl.get<ZoomDrawerController>();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _controller,
      menuScreenWidth: MediaQuery.of(context).size.width,
      menuBackgroundColor: AppColor.background,
      drawerShadowsBackgroundColor: AppColor.background,
      showShadow: true,
      style: DrawerStyle.style2,
      menuScreen: const SettingScreen(),
      mainScreen: const AllNoteScreen(),
    );
  }
}
