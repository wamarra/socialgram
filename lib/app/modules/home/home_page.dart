import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:socialgram/app/constants.dart';
import 'package:socialgram/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Socialgram"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  late final ReactionDisposer _disposer;
  @override
  void initState() {
    super.initState();

    _disposer = when((_) => store.user == null,
        () => Modular.to.pushReplacementNamed(Constants.Routes.LOGIN));
  }

  @override
  void dispose() {
    super.dispose();

    _disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Socialgram'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
              child: Text('Logoff'),
              onPressed: () {
                store.logoff();
              }),
        ),
      ),
    );
  }
}
