import 'package:crypto_wallet/modules/root/controllers/root_controller.dart';
import 'package:crypto_wallet/global/common/components/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Root extends StatelessWidget {
  int? index;
  Root({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootController = Get.find<RootController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (index != null) {
        rootController.currentIndex(index);
      }
    });
    return Obx(() => Scaffold(
          body: rootController.currentPage(),
          bottomNavigationBar: BottomBar(
            initialActiveIndex: rootController.currentIndex.value,
            onTap: (index) {
              rootController.currentIndex(index);
            },
          ),
        ));
  }
}
