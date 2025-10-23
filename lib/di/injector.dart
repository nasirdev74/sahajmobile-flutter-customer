import 'injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

@module
abstract class AppModule {
  @lazySingleton
  http.Client get httpClient => http.Client();

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @preResolve
  @lazySingleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}
