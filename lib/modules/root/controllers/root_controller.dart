// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_wallet/global/common/components/default_dialog.dart';

// Package imports:

class RootController {
  final exitDialog = true;
  final currentIndex = 0;
  final List<Widget> pages = [
    // const HomeView(),
    // const ExchangeView(),
    // const AddView(),
    // const ListCoinsView(),
    // const ProfileView()
  ];

  //RootController();

  void changePage(int index) {
    // currentIndex = index;
  }

  Widget currentPage() {
    return pages[currentIndex];
  }

  confirmExit(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const DefaultDialog();
        });
  }
}
