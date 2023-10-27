// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/crypto_wallet_app.dart';

// Package imports:
void main() async {
  await Future.delayed(const Duration(milliseconds: 300));
  runApp(const CryptoWalletApp());
}
