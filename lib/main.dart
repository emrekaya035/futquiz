import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:futquiz/screens/splash_page.dart';
import 'package:futquiz/theme/default_dark_theme.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'firebase_options.dart';
import 'screens/game_one_page.dart';
import 'screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PackageInfo.fromPlatform();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: DefaultDarkTheme(context).theme,
        // theme: ThemeData.dark(useMaterial3: true).copyWith(
        //   colorScheme: const ColorScheme.dark().copyWith(
        //     primary: const Color.fromARGB(218, 154, 226, 177),
        //     secondary: const Color(0xAA1737EB),
        //   ),
        // ),
        routes: {
          HomePage.id: (context) => const HomePage(),
          GameOnePage.id: (context) => const GameOnePage(),
          SplashPage.id: (context) => const SplashPage(),
        },
        home: const SplashPage());
  }
}
