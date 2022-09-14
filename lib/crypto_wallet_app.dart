import 'package:crypto_wallet/src/routes/app_routes.dart';
import 'package:crypto_wallet/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        /* inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: primaryColor),
            hintStyle: TextStyle(color: primaryColor),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ) */
      ),
      initialRoute: '/login',
      getPages: appRoutes,
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
