import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:socialgram/app/modules/profile/profile_module.dart';

void main() {
  setUpAll(() {
    initModule(ProfileModule());
  });
}
