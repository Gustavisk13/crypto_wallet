// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/crypto_wallet_app.dart';
import 'package:crypto_wallet/global/common/bindings/root/root_bindings.dart';

// Package imports:

void main() async {
  RootBinding().dependencies();
  runApp(const CryptoWalletApp());
}
