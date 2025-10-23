// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app/core/app_router.dart' as _i768;
import 'package:app/core/settings.dart' as _i520;
import 'package:app/di/injector.dart' as _i956;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i520.AppSettings>(() => _i520.AppSettings());
    gh.singleton<_i768.AppRouter>(() => _i768.AppRouter());
    gh.lazySingleton<_i519.Client>(() => appModule.httpClient);
    gh.lazySingleton<_i895.Connectivity>(() => appModule.connectivity);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true,
    );
    return this;
  }
}

class _$AppModule extends _i956.AppModule {}
