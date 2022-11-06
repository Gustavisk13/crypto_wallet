// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:crypto_wallet/modules/profile/controllers/contact_form_controller.dart';
import 'package:crypto_wallet/modules/profile/controllers/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => ContactFormController(), fenix: true);
  }
}
