// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/crypto_wallet_app.dart';
import 'package:crypto_wallet/injection_container.dart';

// Package imports:
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeGetIt();

  await Future.delayed(const Duration(milliseconds: 300));
  runApp(const CryptoWalletApp());
}
