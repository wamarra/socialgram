import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialgram/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialgram/app/constants.dart';
import 'package:socialgram/app/modules/login/forgot_password_page.dart';
import 'package:socialgram/app/modules/login/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore(
        firebaseAuth: i.get<FirebaseAuth>(),
        sharedPreferences: i.get<SharedPreferences>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => LoginPage()),
    ChildRoute(Constants.Routes.FORGOT_PASSWORD,
        child: (context, args) => ForgotPasswordPage(),
        transition: TransitionType.rightToLeft),
  ];
}
