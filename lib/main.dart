import 'package:crazy_food/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'data/storage/local_storage.dart';
import 'helper/get_binding.dart';
import 'helper/language/translation.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  LocalStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate, // ONLY if it's a RTL language
      ],
      supportedLocales: const [
        Locale('en', 'US'), // include country code too
        Locale('ar', 'EG'), // include country code too
      ],
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
      translations: Translation(),
      initialBinding: GetBinding(),
      locale: LocalStorage.isAr
          ? const Locale('ar')
          : const Locale('en'),
      fallbackLocale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      title: 'Crazy Food',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}
