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

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
