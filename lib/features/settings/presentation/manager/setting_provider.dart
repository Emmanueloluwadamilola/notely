
import 'package:notely/confiq/helpers/disposable_provider.dart';
import 'package:notely/features/settings/presentation/manager/setting_state.dart';

class SettingProvider extends DisposableProvider {
  var state = SettingState();
  
  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
