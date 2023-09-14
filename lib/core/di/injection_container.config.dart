// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../module/lunch/data/datasource/remote.dart' as _i5;
import '../../module/lunch/data/repository/repo.dart' as _i11;
import '../../module/lunch/domain/repository/repo.dart' as _i10;
import '../../module/lunch/domain/usecases/ingredient.dart' as _i12;
import '../../module/lunch/domain/usecases/recipe.dart' as _i13;
import '../../module/lunch/presentation/change-notifier/lunch.dart' as _i14;
import '../network/dio.dart' as _i4;
import '../network/impl.dart' as _i9;
import '../network/network_info.dart' as _i8;
import '../secure-storage/secure.dart' as _i7;
import 'register_module.dart' as _i15;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.NetworkRequester>(
      () => _i4.NetworkRequester(dio: gh<_i3.Dio>()));
  gh.lazySingleton<_i5.RemoteDS>(
      () => _i5.RemoteDSImpl(requester: gh<_i4.NetworkRequester>()));
  await gh.factoryAsync<_i6.SharedPreferences>(
    () => registerModule.preferences,
    preResolve: true,
  );
  gh.lazySingleton<_i7.SecureStorage>(
      () => _i7.SecureStorageImpl(preferences: gh<_i6.SharedPreferences>()));
  gh.lazySingleton<_i8.NetworkInfo>(
      () => _i8.NetworkInfoImpl(storage: gh<_i7.SecureStorage>()));
  gh.lazySingleton<_i9.ImplFormatter>(
      () => _i9.ImplFormatter(networkInfo: gh<_i8.NetworkInfo>()));
  gh.lazySingleton<_i10.LunchRepo>(() => _i11.LunchRepoImpl(
        remote: gh<_i5.RemoteDS>(),
        formatter: gh<_i9.ImplFormatter>(),
      ));
  gh.lazySingleton<_i12.GetIngredientUsecase>(
      () => _i12.GetIngredientUsecase(repo: gh<_i10.LunchRepo>()));
  gh.lazySingleton<_i13.GetRecipeUsecase>(
      () => _i13.GetRecipeUsecase(repo: gh<_i10.LunchRepo>()));
  gh.factory<_i14.LunchNotifier>(() => _i14.LunchNotifier(
        getIngredientUsecase: gh<_i12.GetIngredientUsecase>(),
        getRecipeUsecase: gh<_i13.GetRecipeUsecase>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i15.RegisterModule {}
