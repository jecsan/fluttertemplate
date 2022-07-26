import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertemplate/app/view/theme/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'login_notifier.dart';

class LoginScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginProvider.notifier);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen<bool>(loginProvider, (_, isLoggedIn) {
      if (isLoggedIn) {
        Navigator.pushNamedAndRemoveUntil(context, Routes.Home, (_) => false);
      }
    });

    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 39),
      child: Center(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'appname',
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 55,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 131,
                height: 131,
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
              ),
              Text(
                '',
                style: TextStyle(color: Colors.redAccent),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'email',
                    border: OutlineInputBorder(),
                    isDense: true),
              ),
              SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                    isDense: true,
                    hintText: 'password',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Container(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 11),
                    onPressed: () async {
                      loginNotifier.login(
                          username: emailController.text,
                          password: passwordController.text);
                    },
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 13),
            ],
          ),
        ),
      ),
    ));
  }
}
