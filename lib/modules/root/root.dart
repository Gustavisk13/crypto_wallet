// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:crypto_wallet/global/common/components/bottom_bar.dart';
import 'package:crypto_wallet/global/utils/styles.dart';
import 'package:crypto_wallet/modules/root/controllers/root_controller.dart';

// ignore: must_be_immutable
class Root extends StatelessWidget {
  int? index;
  Root({Key? key, this.index}) : super(key: key);

  var args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final rootController = Get.find<RootController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (index != null) {
        rootController.currentIndex(index);
      }
    });

    if (args != 'exchange') {
      rootController.currentIndex(0);
    }

    return Obx(() => WillPopScope(
          child: SafeArea(
            child: Scaffold(
              backgroundColor: baseColor,
              body: rootController.currentPage(),
              bottomNavigationBar: BottomBar(
                initialActiveIndex: rootController.currentIndex.value,
                onTap: (index) {
                  rootController.currentIndex(index);
                },
              ),
            ),
          ),
          onWillPop: () async {
            await rootController.confirmExit(context);
            return false;
          },
        ));
  }
}
