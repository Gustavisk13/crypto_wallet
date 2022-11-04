import 'package:crypto_wallet/global/common/components/defaultDialog.dart';
import 'package:crypto_wallet/global/common/components/default_button_component.dart';
import 'package:crypto_wallet/global/common/components/default_title_component.dart';
import 'package:crypto_wallet/global/utils/styles.dart';
import 'package:crypto_wallet/modules/add/add_view.dart';
import 'package:crypto_wallet/modules/exchange/exchange_view.dart';
import 'package:crypto_wallet/modules/home/home_view.dart';
import 'package:crypto_wallet/modules/list/listcoins_view.dart';
import 'package:crypto_wallet/modules/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
          return DefaultDialog();
        });
  }
}
