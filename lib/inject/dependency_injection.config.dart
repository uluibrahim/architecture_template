// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:architecture_template/core/network/api_client.dart' as _i11;
import 'package:architecture_template/core/utils/network_status_manager/network_status_manager.dart'
    as _i5;
import 'package:architecture_template/core/view_model/view_model_factory.dart'
    as _i9;
import 'package:architecture_template/inject/dependency_injection.dart' as _i16;
import 'package:architecture_template/product/providers/app_provider.dart'
    as _i12;
import 'package:architecture_template/product/providers/user_provider.dart'
    as _i6;
import 'package:architecture_template/product/repositories/auth_repository.dart'
    as _i15;
import 'package:architecture_template/product/services/auth_service.dart'
    as _i13;
import 'package:architecture_template/product/services/shared_preferences_service.dart'
    as _i10;
import 'package:architecture_template/screens/bottom_navigation/bottom_navigation_view_model.dart'
    as _i3;
import 'package:architecture_template/screens/home/home_view_model.dart' as _i4;
import 'package:architecture_template/screens/settings/settings_view_model.dart'
    as _i14;
import 'package:architecture_template/screens/template/template_view_model.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.BottomNavigationViewModel>(
        () => _i3.BottomNavigationViewModel());
    gh.factory<_i4.HomeViewModel>(() => _i4.HomeViewModel());
    gh.lazySingleton<_i5.INetworkStatusManager>(
        () => _i5.NetworkStatusManager());
    gh.singleton<_i6.IUserProvider>(_i6.UserProvider());
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i8.TemplateViewModel>(() => _i8.TemplateViewModel());
    gh.singleton<_i9.ViewModelFactory>(_i9.ViewModelFactoryImpl());
    gh.lazySingleton<_i10.ISharedPreferencesService>(
        () => _i10.SharedPreferencesService(gh<_i7.SharedPreferences>()));
    gh.lazySingleton<_i11.IApiClient>(
        () => _i11.ApiClient(gh<_i10.ISharedPreferencesService>()));
    gh.singleton<_i12.IAppProvider>(
        _i12.AppProvider(gh<_i10.ISharedPreferencesService>()));
    gh.lazySingleton<_i13.IAuthService>(
        () => _i13.AuthService(gh<_i11.IApiClient>()));
    gh.factory<_i14.SettingsViewModel>(
        () => _i14.SettingsViewModel(gh<_i12.IAppProvider>()));
    gh.lazySingleton<_i15.IAuthRepository>(
        () => _i15.AuthRepository(gh<_i13.IAuthService>()));
    return this;
  }
}

class _$RegisterModule extends _i16.RegisterModule {}
