import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:crypto_wallet/src/controller/login/bottom_bar_controller.dart';
import 'package:crypto_wallet/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(GetPlatform.isMobile ? 100 : 70);

  int initialActiveIndex = 2;
  BottomBar({this.initialActiveIndex = 2});

  routes(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/home');
        break;
      case 1:
        Get.toNamed('/cotacao');
        break;
      case 2:
        Get.toNamed('/adicionar');
        break;
      case 3:
        Get.toNamed('/listagem');
        break;
      case 4:
        Get.offAllNamed('/perfil');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    BottomBarController bottomBarController = Get.put(BottomBarController());
    return ConvexAppBar(
        backgroundColor: baseColor2,
        items: const [
          TabItem(
            icon: Icons.dashboard,
            title: 'Dashboard',
          ),
          TabItem(icon: Icons.currency_bitcoin, title: 'Cotações'),
          TabItem(icon: Icons.add, title: 'Adicionar'),
          TabItem(icon: Icons.list, title: 'Listagem'),
          TabItem(icon: Icons.people, title: 'Perfil'),
        ],
        initialActiveIndex: initialActiveIndex ?? 2, //optional, default as 0
        onTap: (int i) => routes(i));
  }
}
