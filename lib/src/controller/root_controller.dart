import 'package:crypto_wallet/modules/add/add_view.dart';
import 'package:crypto_wallet/modules/exchange/exchange_view.dart';
import 'package:crypto_wallet/modules/home/home_view.dart';
import 'package:crypto_wallet/modules/list/listcoins_view.dart';
import 'package:crypto_wallet/modules/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
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
}
