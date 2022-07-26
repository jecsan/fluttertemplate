import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:fluttertemplate/app/view/theme/routes.dart';
import 'package:fluttertemplate/app/view/theme/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/core_provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      location: BannerLocation.topEnd,
      child: MaterialApp(
          title: FlavorConfig.instance.variables[TITLE],
          initialRoute: Routes.initial(),
          themeMode: ThemeMode.system,
          theme: Themes.buildLightThemeData(),
          darkTheme: Themes.buildDarkThemeData(),
          routes: Routes.buildRoutes(context)),
    );
  }
}

void setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    child: MyApp(),
    overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
  ));
}

const TITLE = 'title';
