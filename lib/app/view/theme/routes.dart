import 'package:flutter/material.dart';
import 'package:fluttertemplate/app/view/screen/main/main_screen.dart';
import 'package:fluttertemplate/app/view/screen/onboarding/auth/login_screen.dart';
import 'package:fluttertemplate/app/view/screen/onboarding/splash/splash_screen.dart';

class Routes {
  static const OnBoarding = 'onboarding';
  static const Splash = 'splash';
  static const Login = 'login';
  static const REGISTER = 'register';
  static const Home = '/';

  static initial() {
    return Splash;
  }

  static Map<String, WidgetBuilder> buildRoutes(BuildContext context) {
    return {
      Routes.Home: (context) => MainScreen(title: "Test"),
      Routes.Login: (context) => LoginScreen(),
      Routes.Splash: (context) => SplashScreen(),
    };
  }
}
