// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:crypto_wallet/core/utils/styles.dart';
import 'package:crypto_wallet/modules/root/widgets/root_navigation_bar_item.dart';

class RootPage extends StatefulWidget {
  final Widget child;

  const RootPage({super.key, required this.child});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int get currentIndex =>
      _locationToTabIndex(location: GoRouter.of(context).location);

  int _locationToTabIndex({required String location}) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    return index < 0 ? 0 : index;
  }

  void onItemTapped({required int tabIndex}) {
    if (tabIndex != currentIndex) {
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  final tabs = const [
    RootNavigationBarItem(
      label: 'Início',
      icon: Icon(Icons.dashboard),
      activeIcon: Icon(
        Icons.dashboard,
      ),
      initialLocation: '/home',
    ),
    RootNavigationBarItem(
      label: 'Câmbio',
      icon: Icon(Icons.currency_bitcoin),
      activeIcon: Icon(
        Icons.currency_bitcoin,
      ),
      initialLocation: '/exchange',
    ),
    RootNavigationBarItem(
      label: 'Carteiras',
      icon: Icon(Icons.wallet_outlined),
      activeIcon: Icon(
        Icons.wallet_outlined,
      ),
      initialLocation: '/add',
    ),
    RootNavigationBarItem(
      label: 'Moedas',
      icon: Icon(Icons.monetization_on),
      activeIcon: Icon(
        Icons.monetization_on,
      ),
      initialLocation: '/list-coins',
    ),
    RootNavigationBarItem(
      label: 'Perfil',
      icon: Icon(Icons.people),
      activeIcon: Icon(Icons.people),
      initialLocation: '/profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: baseColor2,
        body: widget.child,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: secondaryColor, width: 2)),
          ),
          child: BottomNavigationBar(
              backgroundColor: baseColor,
              selectedItemColor: secondaryColor,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: tabs,
              currentIndex: currentIndex,
              onTap: (index) => onItemTapped(tabIndex: index)),
        ),
      ),
    );
  }
}
