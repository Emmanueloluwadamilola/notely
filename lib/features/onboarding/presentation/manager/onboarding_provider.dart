import 'package:notely/config/di/injector_container.dart';
import 'package:notely/config/helpers/disposable_provider.dart';
import 'package:notely/features/onboarding/presentation/manager/splash_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider extends DisposableProvider{
  final _pref = sl.getAsync<SharedPreferences>();

    setOnboarding() {
    _pref.then((value) {
      value.setBool(SplashProvider.onboardingKey, true);
    });
  }
  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
  
}