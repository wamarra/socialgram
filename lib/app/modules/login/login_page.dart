import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:socialgram/app/constants.dart';
import 'package:socialgram/app/modules/login/login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'Socialgram'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _disposer = when((_) => store.user != null,
        () => Modular.to.pushReplacementNamed(Constants.Routes.HOME));
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TextButton(
            child: Text('Não tem cadastro?',
                style: TextStyle(color: Theme.of(context).buttonColor)),
            onPressed: () {
              Modular.to.pushNamed(Constants.Routes.REGISTER);
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Image.asset('assets/login.png', fit: BoxFit.fitWidth),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'E-mail:',
                  hintText: 'fulano@provedor.com',
                  hintStyle: TextStyle(color: Colors.black26)),
            ),
            SizedBox(height: 24),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha:',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Observer(
                builder: (_) {
                  if (store.loading) {
                    return Transform.scale(
                      scale: 0.5,
                      child: CircularProgressIndicator(
                          color: Theme.of(context).buttonColor),
                    );
                  }
                  return Text('ACESSAR');
                },
              ),
              onPressed: () {
                store.loginWith(
                    email: _emailController.text,
                    password: _passwordController.text);
              },
            ),
            TextButton(
              child: Text('Esqueceu a senha?'),
              onPressed: () {
                Modular.to.pushNamed(Constants.Routes.FORGOT_PASSWORD);
              },
            ),
          ],
        ),
      ),
    );
  }
}
