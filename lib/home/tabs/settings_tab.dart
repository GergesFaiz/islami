import 'package:flutter/material.dart';
import 'package:islami/My_Theme.dart';
import 'package:islami/bottom_sheets/Theme_bottom_sheet.dart';
import 'package:islami/bottom_sheets/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text('Language', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  isDismissible: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: LanguageBottomSheet(),
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: MyThemeData.primaryColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                child:  Text(provider.languageCode, style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
            const SizedBox(height: 32),
             Text('Theme', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  isDismissible: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ThemeBottomSheet(),
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: MyThemeData.primaryColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                child:  Text(provider.themeMode==ThemeMode.light?"light":"Dark", style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
