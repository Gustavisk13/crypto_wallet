import 'package:crypto_wallet/global/common/bindings/root/root_bindings.dart';
import 'package:crypto_wallet/modules/add/add_view.dart';
import 'package:crypto_wallet/modules/eula/eula_view.dart';
import 'package:crypto_wallet/modules/exchange/exchange_view.dart';
import 'package:crypto_wallet/modules/home/home_view.dart';
import 'package:crypto_wallet/modules/list/listcoins_view.dart';
import 'package:crypto_wallet/modules/login/login_view.dart';
import 'package:crypto_wallet/modules/profile/profile_view.dart';
import 'package:crypto_wallet/modules/register/register_view.dart';
import 'package:crypto_wallet/modules/root/root.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final appRoutes = [
    GetPage(name: "/login", page: () => LoginView()),
    GetPage(name: "/register", page: () => RegisterView()),
    GetPage(name: "/eula", page: () => EulaView()),
    GetPage(
      name: "/root/:index",
      page: () => Root(
        index: int.parse(Get.parameters['index']!),
      ),
      binding: RootBinding(),
    ),
    GetPage(name: "/home", page: () => const HomeView()),
    GetPage(name: "/exchange", page: () => const ExchangeView()),
    GetPage(name: "/add", page: () => const AddView()),
    GetPage(name: "/list-coins", page: () => const ListCoinsView()),
    GetPage(name: "/profile", page: () => const ProfileView()),
  ];

  static final appIndexes = [
    "/home",
    "/exchange",
    "/add",
    "/list-coins",
    "/profile",
  ];
}
