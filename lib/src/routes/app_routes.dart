import 'package:crypto_wallet/src/view/eula.dart';
import 'package:crypto_wallet/src/view/login.dart';
import 'package:crypto_wallet/src/view/register.dart';
import 'package:crypto_wallet/src/view/teste.dart';
import 'package:get/get.dart';

class Auth extends GetMiddleware {
  @override
  int? get priority => 1;

/*   RouteSettings? redirect(String? route) {
    if (isAuthenticated()) {
      return null;
    } else {
      return RouteSettings(name: '/login');
    }
  } */
}

class AuthGuard extends GetMiddleware {
  /* String route;
  AuthGuard({
    required this.route,
  });

//   The default is 0 but you can update it to any number. Please ensure you match the priority based
//   on the number of guards you have.
  @override
  int? get priority => 1;

  bool verificarPermissao() {
    var permissao = false;

    if (getUsuario().perfilUsuario == null) return permissao;

    getUsuario().perfilUsuario!.funcionalidades!.forEach((element) {
      element.subFuncionalidades!.forEach((element) {
        if (element.rota == route) {
          permissao = true;
          return;
        }
      });
    });
    return permissao;
  }

  @override
  RouteSettings? redirect(String? route) {
    if (verificarPermissao()) {
      return null;
    } else {
      return RouteSettings(name: '/permissao');
    }
  }
} */

}

var appRoutes = [
  GetPage(name: "/login", page: () => LoginView()),
  GetPage(name: "/register", page: () => RegisterView()),
  GetPage(name: "/eula", page: () => EulaView()),
  GetPage(name: "/teste", page: () => TesteView()),
];
