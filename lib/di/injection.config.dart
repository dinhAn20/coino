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
import 'package:trading_app/common/api_client/api_client.dart' as _i7;
import 'package:trading_app/data/local/datasource/auth_local_datasource.dart'
    as _i8;
import 'package:trading_app/data/local/keychain/shared_prefs.dart' as _i6;
import 'package:trading_app/data/remote/auth/auth_service.dart' as _i9;
import 'package:trading_app/data/remote/ayah/ayah_service.dart' as _i10;
import 'package:trading_app/data/remote/book/book_service.dart' as _i11;
import 'package:trading_app/data/remote/juzu/juzu_service.dart' as _i12;
import 'package:trading_app/data/remote/surah/surah_service.dart' as _i13;
import 'package:trading_app/di/modules.dart' as _i26;
import 'package:trading_app/modules/auth/bloc/auth_cubit.dart' as _i22;
import 'package:trading_app/modules/ayah/bloc/search_ayahs_cubit.dart' as _i20;
import 'package:trading_app/modules/book/bloc/book_cubit.dart' as _i23;
import 'package:trading_app/modules/common/bloc/app_cubit.dart' as _i3;
import 'package:trading_app/modules/home/bloc/home_cubit.dart' as _i24;
import 'package:trading_app/modules/juzu/bloc/juzu_cubit.dart' as _i25;
import 'package:trading_app/modules/my_profile/bloc/change_password_cubit.dart'
    as _i17;
import 'package:trading_app/modules/my_profile/bloc/edit_profile_cubit.dart'
    as _i18;
import 'package:trading_app/repositories/auth_repository.dart' as _i14;
import 'package:trading_app/repositories/ayah_repository.dart' as _i15;
import 'package:trading_app/repositories/book_repository.dart' as _i16;
import 'package:trading_app/repositories/juzu_repository.dart' as _i19;
import 'package:trading_app/repositories/surah_repository.dart' as _i21;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

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
    gh.lazySingleton<_i10.AyahService>(
        () => _i10.AyahServiceImpl(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i11.BookService>(
        () => _i11.BookServiceImpl(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i12.JuzuService>(
        () => _i12.JuzuServiceImpl(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i13.SurahService>(
        () => _i13.SurahServiceImpl(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i14.AuthRepository>(() => _i14.AuthRepositoryImpl(
          authService: gh<_i9.AuthService>(),
          authLocalDatasource: gh<_i8.AuthLocalDatasource>(),
        ));
    gh.lazySingleton<_i15.AyahRepository>(
        () => _i15.AyahRepositoryImpl(ayahService: gh<_i10.AyahService>()));
    gh.lazySingleton<_i16.BookRepository>(
        () => _i16.BookRepositoryImpl(bookService: gh<_i11.BookService>()));
    gh.factory<_i17.ChangePasswordCubit>(() =>
        _i17.ChangePasswordCubit(authRepository: gh<_i14.AuthRepository>()));
    gh.factory<_i18.EditProfileCubit>(
        () => _i18.EditProfileCubit(authRepository: gh<_i14.AuthRepository>()));
    gh.lazySingleton<_i19.JuzuRepository>(
        () => _i19.JuzuRepositoryImpl(juzuService: gh<_i12.JuzuService>()));
    gh.factory<_i20.SearchAyahsCubit>(
        () => _i20.SearchAyahsCubit(ayahRepository: gh<_i15.AyahRepository>()));
    gh.lazySingleton<_i21.SurahRepository>(
        () => _i21.SurahRepositoryImpl(surahService: gh<_i13.SurahService>()));
    gh.singleton<_i22.AuthCubit>(_i22.AuthCubit(
      authRepository: gh<_i14.AuthRepository>(),
      authLocalDatasource: gh<_i8.AuthLocalDatasource>(),
    ));
    gh.factory<_i23.BookCubit>(
        () => _i23.BookCubit(bookRepository: gh<_i16.BookRepository>()));
    gh.factory<_i24.HomeCubit>(
        () => _i24.HomeCubit(surahRepository: gh<_i21.SurahRepository>()));
    gh.factory<_i25.JuzuCubit>(
        () => _i25.JuzuCubit(juzuRepository: gh<_i19.JuzuRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i26.InjectableModule {}
