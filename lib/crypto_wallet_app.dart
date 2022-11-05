// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:crypto_wallet/global/routes/app_routes.dart';
import 'package:crypto_wallet/global/themes/normal_theme.dart';

class CryptoWalletApp extends StatefulWidget {
  const CryptoWalletApp({Key? key}) : super(key: key);

  @override
  CryptoWalletAppState createState() => CryptoWalletAppState();
}

class CryptoWalletAppState extends State<CryptoWalletApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crypto Wallet',
      theme: NormalTheme.getTheme(context),
      initialRoute: '/login',
      getPages: AppRoutes.appRoutes,
      debugShowCheckedModeBanner: false,
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
      ),
    );
  }
}
