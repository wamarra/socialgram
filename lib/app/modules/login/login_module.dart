import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialgram/app/constants.dart';
import 'package:socialgram/app/modules/login/forgot_password_page.dart';
import 'package:socialgram/app/modules/login/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
    ChildRoute(Constants.Routes.FORGOT_PASSWORD,
        child: (_, args) => ForgotPasswordPage()),
  ];
}
