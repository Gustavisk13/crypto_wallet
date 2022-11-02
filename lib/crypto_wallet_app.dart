import 'package:crypto_wallet/global/routes/app_routes.dart';
import 'package:crypto_wallet/global/themes/normal_theme.dart';
import 'package:crypto_wallet/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoWalletApp extends StatefulWidget {
  const CryptoWalletApp({Key? key}) : super(key: key);

  @override
  _CryptoWalletAppState createState() => _CryptoWalletAppState();
}

class _CryptoWalletAppState extends State<CryptoWalletApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crypto Wallet',
      theme: NormalTheme.getTheme(context),
      initialRoute: '/login',
      getPages: AppRoutes.appRoutes,
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
      ),
    );
  }
}
