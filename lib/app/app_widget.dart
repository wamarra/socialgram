import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialgram/app/dark_theme.dart';
import 'package:socialgram/app/light_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Socialgram',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light)
        .modular();
  }
}
