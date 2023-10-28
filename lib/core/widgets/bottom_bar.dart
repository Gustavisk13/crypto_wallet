// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

// Project imports:
import 'package:crypto_wallet/core/utils/styles.dart';

class BottomBar extends StatelessWidget {
  final int? initialActiveIndex;
  final Function? onTap;
  const BottomBar({Key? key, this.initialActiveIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ConvexAppBarState> appBarKey = GlobalKey<ConvexAppBarState>();

    return ConvexAppBar(
      curve: Curves.easeInOut,
      backgroundColor: baseColor2,
      key: appBarKey,
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
      initialActiveIndex: initialActiveIndex ?? 2,
      //optional, default as 0
      onTap: (index) {
        if (onTap != null) {
          onTap!(index);
          appBarKey.currentState!.animateTo(index);
        }
      },
    );
  }
}
