// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:crypto_wallet/core/routes/app_routes.dart';
import 'package:crypto_wallet/modules/add/add_view.dart';
import 'package:crypto_wallet/modules/coin/presentation/pages/exchange_page.dart';
import 'package:crypto_wallet/modules/eula/eula_view.dart';
import 'package:crypto_wallet/modules/home/home_view.dart';
import 'package:crypto_wallet/modules/list/listcoins_view.dart';
import 'package:crypto_wallet/modules/login/login_view.dart';
import 'package:crypto_wallet/modules/profile/profile_view.dart';
import 'package:crypto_wallet/modules/register/register_view.dart';
import 'package:crypto_wallet/modules/root/root.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.homePath,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        name: AppRoutes.login,
        path: AppRoutes.loginPath,
        builder: (context, state) => const LoginPage(),
        routes: [
          GoRoute(
            name: AppRoutes.register,
            path: AppRoutes.registerPath,
            pageBuilder: (context, state) => NoTransitionPage(
              child: RegisterPage(),
            ),
            routes: [
              GoRoute(
                name: AppRoutes.eula,
                path: AppRoutes.eulaPath,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: EulaPage(),
                ),
              ),
            ],
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(child: RootPage(child: child));
        },
        routes: [
          GoRoute(
            name: AppRoutes.home,
            path: AppRoutes.homePath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),
          GoRoute(
            name: AppRoutes.exchange,
            path: AppRoutes.exchangePath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ExchangePage(),
            ),
          ),
          GoRoute(
            name: AppRoutes.add,
            path: AppRoutes.addPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AddPage(),
            ),
          ),
          GoRoute(
            name: AppRoutes.listCoins,
            path: AppRoutes.listCoinsPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ListCoinsPage(),
            ),
          ),
          GoRoute(
            name: AppRoutes.profile,
            path: AppRoutes.profilePath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfilePage(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      log('Page not found: ${state.error}');
      return const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      );
    },
  );
}
