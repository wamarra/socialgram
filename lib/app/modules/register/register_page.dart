import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:socialgram/app/constants.dart';
import 'package:socialgram/app/modules/register/register_store.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'Socialgram'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends ModularState<RegisterPage, RegisterStore> {
  late PageController _pageController;
  late final TextEditingController _nameController;
  late final FocusNode _nameFocusNode;
  late final TextEditingController _emailController;
  late final FocusNode _emailFocusNode;
  late final TextEditingController _passwordController;
  late final FocusNode _passwordFocusNode;
  late final ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _nameController = new TextEditingController();
    _nameFocusNode = new FocusNode();
    _emailController = new TextEditingController();
    _emailFocusNode = new FocusNode();
    _passwordController = new TextEditingController();
    _passwordFocusNode = new FocusNode();

    _disposer = when((_) => store.user != null,
        () => Modular.to.pushReplacementNamed(Constants.Routes.HOME));
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  late final Widget _form = PageView(
    controller: _pageController,
    scrollDirection: Axis.vertical,
    physics: NeverScrollableScrollPhysics(),
    children: [
      _FormField(
        controller: _nameController,
        label: 'Qual é o seu nome?',
        showBackButton: false,
        onNext: () {
          _pageController.nextPage(
              duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        },
        onBack: () {
          _pageController.previousPage(
              duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        },
        focusNode: _nameFocusNode,
      ),
      _FormField(
        controller: _emailController,
        label: 'Informe seu email!',
        showBackButton: true,
        onNext: () {
          _pageController.nextPage(
              duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        },
        onBack: () {
          _pageController.previousPage(
              duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        },
        focusNode: _emailFocusNode,
      ),
      _FormField(
        controller: _passwordController,
        label: 'Crie uma senha!',
        showBackButton: true,
        onNext: () {
          store.registerUser(
              name: _nameController.text,
              email: _emailController.text,
              password: _passwordController.text);
        },
        onBack: () {
          _pageController.previousPage(
              duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        },
        focusNode: _passwordFocusNode,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        actions: [
          TextButton(
            child: Text('Já tem cadastro?',
                style: TextStyle(color: Theme.of(context).buttonColor)),
            onPressed: () {
              Modular.to.pushReplacementNamed(Constants.Routes.LOGIN);
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Observer(builder: (_) {
        if (store.loading) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CircularProgressIndicator(), Text('Carregando...')],
          );
        }
        return _form;
      }),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final bool showBackButton;
  final String label;
  final VoidCallback onNext;
  final VoidCallback onBack;
  final FocusNode focusNode;

  const _FormField(
      {required this.controller,
      this.showBackButton = true,
      required this.label,
      required this.onNext,
      required this.onBack,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        showBackButton
            ? IconButton(
                icon: Icon(Icons.arrow_upward),
                onPressed: onBack,
                color: Theme.of(context).primaryColorLight,
              )
            : SizedBox.fromSize(
                size: Size.zero,
              ),
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(label,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline6!
                          .copyWith(fontSize: 60),
                      maxLines: 1),
                ),
                TextFormField(
                  controller: controller,
                  onEditingComplete: onNext,
                  focusNode: focusNode,
                  autofocus: true,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline1!
                      .copyWith(fontSize: 28),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
