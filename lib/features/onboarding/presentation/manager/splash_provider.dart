import 'package:flutter/material.dart';
import 'package:notely/config/di/injector_container.dart';
import 'package:notely/config/helpers/disposable_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends DisposableProvider {
  final _pref = sl.getAsync<SharedPreferences>();
  SplashProvider() {
    Future.delayed(const Duration(milliseconds: 3500), () {
      _pref.then((value) {
        if (value.getBool(onboardingKey) == null) {
          add(0);
          return;
        } else {
          add(1);
          return;
        }
      });
    });
  }

  static const onboardingKey = 'onboarding';
  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
