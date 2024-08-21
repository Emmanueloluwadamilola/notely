import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:notely/confiq/di/injector_container.config.dart';

GetIt sl = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => sl.init();