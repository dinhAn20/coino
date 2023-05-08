// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;
import 'package:trading_app/common/api_client/api_client.dart' as _i7;
import 'package:trading_app/data/local/datasource/auth_local_datasource.dart'
    as _i8;
import 'package:trading_app/data/local/keychain/shared_prefs.dart' as _i6;
import 'package:trading_app/data/remote/auth/auth_service.dart' as _i9;
import 'package:trading_app/di/modules.dart' as _i14;
import 'package:trading_app/modules/auth/bloc/auth_cubit.dart' as _i13;
import 'package:trading_app/modules/common/bloc/app_cubit.dart' as _i3;
import 'package:trading_app/modules/my_profile/bloc/change_password_cubit.dart'
    as _i11;
import 'package:trading_app/modules/my_profile/bloc/edit_profile_cubit.dart'
    as _i12;
import 'package:trading_app/repositories/auth_repository.dart' as _i10;

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
    final injectableModule = _$InjectableModule();
    gh.singleton<_i3.AppCubit>(_i3.AppCubit());
    gh.lazySingleton<_i4.Dio>(() => injectableModule.dio);
    await gh.factoryAsync<_i5.SharedPreferences>(
      () => injectableModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i6.SharedPrefs>(
        () => _i6.SharedPrefs(gh<_i5.SharedPreferences>()));
    gh.singleton<_i7.ApiClient>(_i7.ApiClient(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i8.AuthLocalDatasource>(
        () => _i8.AuthLocalDatasourceImpl(gh<_i6.SharedPrefs>()));
    gh.lazySingleton<_i9.AuthService>(
        () => _i9.AuthServiceImpl(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i10.AuthRepository>(() => _i10.AuthRepositoryImpl(
          authService: gh<_i9.AuthService>(),
          authLocalDatasource: gh<_i8.AuthLocalDatasource>(),
        ));
    gh.factory<_i11.ChangePasswordCubit>(() =>
        _i11.ChangePasswordCubit(authRepository: gh<_i10.AuthRepository>()));
    gh.factory<_i12.EditProfileCubit>(
        () => _i12.EditProfileCubit(authRepository: gh<_i10.AuthRepository>()));
    gh.singleton<_i13.AuthCubit>(_i13.AuthCubit(
      authRepository: gh<_i10.AuthRepository>(),
      authLocalDatasource: gh<_i8.AuthLocalDatasource>(),
    ));
    return this;
  }
}

class _$InjectableModule extends _i14.InjectableModule {}
