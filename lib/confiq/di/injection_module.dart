import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectionModule {
  @singleton
  ZoomDrawerController get zoomController => ZoomDrawerController();

  Future<SharedPreferences> preferences() {
    return SharedPreferences.getInstance();
  }
}
