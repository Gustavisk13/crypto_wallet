// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:crypto_wallet/core/routes/app_router.dart';
import 'package:crypto_wallet/core/themes/normal_theme.dart';
import 'package:crypto_wallet/injection_container.dart';

// Package imports:

class CryptoWalletApp extends StatefulWidget {
  const CryptoWalletApp({Key? key}) : super(key: key);

  @override
  CryptoWalletAppState createState() => CryptoWalletAppState();
}

class CryptoWalletAppState extends State<CryptoWalletApp> {
  final GoRouter router = getIt<AppRouter>().router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Crypto Wallet',
      theme: NormalTheme.getTheme(context),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
