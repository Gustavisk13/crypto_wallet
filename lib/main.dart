// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/crypto_wallet_app.dart';
import 'package:crypto_wallet/global/common/bindings/global_bindings.dart';

// Package imports:

void main() async {
  GlobalBindings().dependencies();
  await Future.delayed(const Duration(milliseconds: 300));

  runApp(const CryptoWalletApp());
}
