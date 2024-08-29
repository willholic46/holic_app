import 'package:flutter/material.dart';
import 'package:holic_app/home-page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';

import 'model/locale.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleModel(),
      child: Consumer<LocaleModel>(
        builder: (context, localeModel, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Holic.',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: localeModel.locale,
          home: const HomePage(),
          theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              fillColor: Color.fromRGBO(217, 217, 217, 1),
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(20, 20, 20, 1),
                  width: 1.5,
                ),
              ),
            ),
            primaryColor: const Color.fromRGBO(255, 81, 47, 1),
            scaffoldBackgroundColor: const Color.fromRGBO(217, 217, 217, 1),
          ),
        ),
      ),
    );
  }
}
