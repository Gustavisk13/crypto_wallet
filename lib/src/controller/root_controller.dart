import 'package:crypto_wallet/src/view/home.dart';
import 'package:crypto_wallet/src/view/perfil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  final currentIndex = 0.obs;
  final List<Widget> pages = [
    const HomeView(),
    const PerfilView(),
  ];
}
