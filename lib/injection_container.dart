// Package imports:
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:crypto_wallet/core/config/environment_config.dart';
import 'package:crypto_wallet/core/network/network_info.dart';
import 'package:crypto_wallet/core/routes/app_router.dart';
import 'package:crypto_wallet/modules/coin/data/datasources/coin_local_datasource.dart';
import 'package:crypto_wallet/modules/coin/data/datasources/coin_remote_datasource.dart';
import 'package:crypto_wallet/modules/coin/data/repositories/coin_repository_impl.dart';
import 'package:crypto_wallet/modules/coin/domain/repositories/coin_repository.dart';
import 'package:crypto_wallet/modules/coin/domain/usecases/get_coin.dart';

final getIt = GetIt.instance;

Future<void> initializeGetIt() async {
  //! Features - Coin
  // Use cases
  getIt.registerLazySingleton(() => GetCoin(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<CoinRepository>(
    () => CoinRepositoryImpl(
      localDataSource: getIt(),
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<CoinLocalDataSource>(
    () => CoinLocalDataSourceImpl(
      sharedPreferences: getIt(),
    ),
  );
  getIt.registerLazySingleton<CoinRemoteDataSource>(
    () => CoinRemoteDataSourceImpl(
      client: getIt(),
    ),
  );

  //! Core
  getIt.registerSingleton<EnvironmentConfig>(EnvironmentConfig.init());

  getIt.registerSingleton<AppRouter>(AppRouter());

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: getIt(),
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
