import 'package:notely/app/views/widgets/custom_form_validation.dart';
import 'package:notely/confiq/helpers/disposable_provider.dart';
import 'package:notely/features/auth/presentation/manager/auth_state.dart';

class AuthenticationProvider extends DisposableProvider {
  final state = AuthState();

  validateInputs() {
    var canSubmit = true;

    state.emailError = CustomFormValidation.errorMessageEmail(
        state.email, 'Email is required');

    state.passwordError = CustomFormValidation.validatePassword(
        state.password, "Password is required");
    state.nameError =
        CustomFormValidation.errorMessage(state.name, 'Name is required');
    state.cityError =
        CustomFormValidation.errorMessage(state.name, 'City is required');

    if (state.emailError != '' || state.passwordError != '') {
      canSubmit = false;
    }
    state.canSubmit.value = canSubmit;
    notifyListeners();
  }

  setName(name) {
    state.name = name;
    validateInputs();
    notifyListeners();
  }

  setEmail(email) {
    state.email = email;
    validateInputs();
    notifyListeners();
  }

  setPassword(password) {
    state.password = password;
    validateInputs();
    notifyListeners();
  }

  setCountry(country) {
    state.countryName = country;
    notifyListeners();
  }

  setCity(city) {
    state.city = city;
    validateInputs();
    notifyListeners();
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
