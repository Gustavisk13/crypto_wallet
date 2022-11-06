// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:crypto_wallet/global/common/bindings/profile/profile_bindings.dart';
import 'package:crypto_wallet/global/common/bindings/root/root_bindings.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    RootBinding().dependencies();
    ProfileBindings().dependencies();
  }
}
