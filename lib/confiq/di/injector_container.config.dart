// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart' as _i1070;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:notely/confiq/di/injection_module.dart' as _i565;
import 'package:notely/features/home/presentation/manager/note_provider.dart'
    as _i647;
import 'package:notely/features/settings/presentation/manager/setting_provider.dart'
    as _i71;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.factoryAsync<_i460.SharedPreferences>(
        () => injectionModule.preferences());
    gh.singleton<_i1070.ZoomDrawerController>(
        () => injectionModule.zoomController);
    gh.lazySingleton<_i647.NoteProvider>(() => _i647.NoteProvider());
    gh.lazySingleton<_i71.SettingProvider>(() => _i71.SettingProvider());
    return this;
  }
}

class _$InjectionModule extends _i565.InjectionModule {}
