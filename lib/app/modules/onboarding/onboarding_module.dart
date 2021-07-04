import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialgram/app/modules/onboarding/onboarding_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialgram/app/modules/onboarding/onboarding_page.dart';

class OnboardingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OnboardingStore(i.get<SharedPreferences>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => OnboardingPage()),
  ];
}
