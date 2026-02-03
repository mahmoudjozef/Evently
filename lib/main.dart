import 'package:evently_new/Screens/Add%20event/Add_event_Sceren.dart';
import 'package:evently_new/Screens/Home/HomeScreen.dart';
import 'package:evently_new/Screens/Home/Taps/Home.dart';
import 'package:evently_new/Screens/forgetPassword.dart';
import 'package:evently_new/Screens/signUp.dart';
import 'package:evently_new/providers/Theme_Provider.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'Screens/Login.dart';
import 'Screens/OnBording_Screen.dart';
import 'Screens/intro_screen.dart';
import 'class/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.DarkTheme,
      themeMode: myProvider.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: Homescreen.routeNamed,
      routes: {
        OnbordingScreen.routeNamed: (context) => OnbordingScreen(),
        intro_screen.routeNamed: (context) => intro_screen(),
        Login.routeNamed: (context) => Login(),
        SignUp.routeNamed: (context) => SignUp(),
        Homescreen.routeNamed: (context) => Homescreen(),
        forgetPassword.routeNamed: (context) => forgetPassword(),
        AddEventSceren.routeNamed: (context) => AddEventSceren(),
      },
    );
  }
}
