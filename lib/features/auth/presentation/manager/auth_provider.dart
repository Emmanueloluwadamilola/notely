import 'package:notely/confiq/helpers/disposable_provider.dart';
import 'package:notely/features/auth/presentation/manager/auth_state.dart';

class AuthenticationProvider extends DisposableProvider {
  final state = AuthState();

  setName(name) {
    state.name = name;
    notifyListeners();
  }

  setEmail(email) {
    state.email = email;
    notifyListeners();
  }

  setPassword(password) {
    state.password = password;
    notifyListeners();
  }

  setCountry(country) {
    state.countryName = country;
    notifyListeners();
  }

  setCity(city) {
    state.city = city;
    notifyListeners();
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
