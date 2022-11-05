// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:crypto_wallet/modules/root/controllers/root_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController(), fenix: true);
  }
}
