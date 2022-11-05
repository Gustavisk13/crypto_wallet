import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:crypto_wallet/crypto_wallet_app.dart';
import 'package:crypto_wallet/global/common/bindings/root/root_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: "env");
  RootBinding().dependencies();
  runApp(const CryptoWalletApp());
}
