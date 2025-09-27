import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/My_Theme.dart';
import 'package:islami/home/tabs/ahadeth_tab.dart';
import 'package:islami/home/tabs/radio_tab.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'hadeth_details/hadeth_details.dart';
import 'home/home.dart';
import 'sura_details/sura_details.dart';
import 'home/tabs/quran_tab.dart';
import 'home/tabs/sebha_tab.dart';
import 'home/tabs/settings_tab.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp( ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale:  Locale('${provider.languageCode}'),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      theme:MyThemeData.lightTheme,
      darkTheme: MyThemeData.DarkTheme,
      themeMode: provider.themeMode,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
    );
  }
}
