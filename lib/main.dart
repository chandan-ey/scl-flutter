import 'package:flutter/material.dart';
import 'screen/login/login.dart';
import 'screen/home/home.dart';
import 'screen/dealeronboarding/step1.dart';
import 'package:get/get.dart';
import 'translation/LocaleString.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'Shree Cements',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Roboto'),
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(homepagemode: ''),
        '/onboardone': ((context) => const OnBoardOnePage())
      },
      initialRoute: '/',
    );
  }
}
