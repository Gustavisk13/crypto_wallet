// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:crypto_wallet/core/routes/app_router.dart';

final getIt = GetIt.instance;

Future<void> initializeGetIt() async {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
