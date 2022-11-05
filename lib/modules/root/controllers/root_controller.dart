// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:crypto_wallet/global/common/components/default_dialog.dart';
import 'package:crypto_wallet/modules/add/add_view.dart';
import 'package:crypto_wallet/modules/exchange/exchange_view.dart';
import 'package:crypto_wallet/modules/home/home_view.dart';
import 'package:crypto_wallet/modules/list/listcoins_view.dart';
import 'package:crypto_wallet/modules/profile/profile_view.dart';

class RootController extends GetxController {
  final exitDialog = true.obs;
  final currentIndex = 0.obs;
  final List<Widget> pages = [
    const HomeView(),
    const ExchangeView(),
    const AddView(),
    const ListCoinsView(),
    const ProfileView()
  ];

  //RootController();

  void changePage(int index) {
    currentIndex(index);
  }

  Widget currentPage() {
    return pages[currentIndex.value];
  }

  confirmExit(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const DefaultDialog();
        });
  }
}
