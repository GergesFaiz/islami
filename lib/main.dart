import 'package:flutter/material.dart';
import 'package:islami/home/tabs/ahadeth_tab.dart';
import 'package:islami/home/tabs/radio_tab.dart';

import 'home/home.dart';
import 'home/sura_details.dart';
import 'home/tabs/quran_tab.dart';
import 'home/tabs/sebha_tab.dart';
import 'home/tabs/settings_tab.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        RadioTab.routeName: (context) => RadioTab(),
        AhadethTab.routeName:(context)=>AhadethTab(),
        SebhaTab.routeName:(context)=>SebhaTab(),
        SettingsTab.routeName:(context)=>SettingsTab(),
        QuranTab.routeName:(context)=>QuranTab(),
        SuraDetails.routeName:(context)=>SuraDetails(),
      },

    );
  }
}
