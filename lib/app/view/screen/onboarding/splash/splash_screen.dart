import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/core_provider.dart';
import 'package:fluttertemplate/core/repository/account/account_manager.dart';
import 'package:fluttertemplate/app/view/theme/app_colors.dart';
import 'package:fluttertemplate/app/view/theme/images.dart';
import 'package:fluttertemplate/app/view/theme/routes.dart';
import 'package:fluttertemplate/app/view/theme/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const FRESH_INSTALL = 'fresh_install';

class SplashScreen extends HookConsumerWidget {
  static const SPLASH_DURATION = 1000;

  void _redirect(BuildContext context, AccountManager accountManager,
      SharedPreferences prefs) async {
    if (Platform.isIOS) {
      if (!prefs.containsKey(FRESH_INSTALL)) {
        await accountManager.logout();
        await prefs.setBool(FRESH_INSTALL, false);
      }
    }

    await Future.delayed(const Duration(milliseconds: SPLASH_DURATION))
        .then((value) async => {
              if (accountManager.isLoggedIn)
                {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.Home, (_) => false)
                }
              else
                {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.Login, (_) => false)
                }
            });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountManager = ref.watch(accountManagerProvider.notifier);
    final sharedPrefs = ref.watch(sharedPreferencesProvider);

    _redirect(context, accountManager, sharedPrefs);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'splabs-logo',
              child: Image.asset(
                Images.logo,
                height: 140,
              ),
            ),
            Container(
              height: 10,
            ),
            Hero(
              tag: 'splabs-text',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Strings.appName,
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline4,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(Strings.appName,
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline4,
                          color: Colors.black,
                          fontWeight: FontWeight.w300))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
