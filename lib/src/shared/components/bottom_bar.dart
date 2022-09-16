import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:crypto_wallet/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(GetPlatform.isMobile ? 100 : 70);

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
        backgroundColor: baseColor2,
        items: const [
          TabItem(icon: Icons.dashboard, title: 'Dashboard'),
          TabItem(icon: Icons.currency_bitcoin, title: 'Cotações'),
          TabItem(icon: Icons.add, title: 'Adicionar'),
          TabItem(icon: Icons.list, title: 'Listagem'),
          TabItem(icon: Icons.people, title: 'Perfil'),
        ],
        initialActiveIndex: 2, //optional, default as 0
        onTap: (int i) => print('click index=$i'));
  }
}
