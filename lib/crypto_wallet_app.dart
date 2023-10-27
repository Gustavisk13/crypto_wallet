// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:crypto_wallet/global/routes/app_router.dart';
import 'package:crypto_wallet/global/themes/normal_theme.dart';

// Package imports:

class CryptoWalletApp extends StatefulWidget {
  const CryptoWalletApp({Key? key}) : super(key: key);

  @override
  CryptoWalletAppState createState() => CryptoWalletAppState();
}

class CryptoWalletAppState extends State<CryptoWalletApp> {
  final GoRouter router = AppRouter().router;

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
