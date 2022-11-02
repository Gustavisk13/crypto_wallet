import 'package:crypto_wallet/src/controller/root_controller.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController(), fenix: true);
  }
}
