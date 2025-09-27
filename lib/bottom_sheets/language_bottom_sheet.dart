import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/My_Theme.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  provider.changLanguage("en");
                },
                child: Text(
                  'English',
                  style: TextStyle(
                    color: provider.languageCode == "en"
                        ? MyThemeData.primaryColor
                        : MyThemeData.balckColor,
                    fontSize: 30,
                  ),
                ),
              ),
              if (provider.languageCode == "en") ...[
                Icon(Icons.done, size: 35, color: MyThemeData.primaryColor),
              ],
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  provider.changLanguage("ar");
                },
                child: Text(
                  'Arabic',
                  style: TextStyle(
                    color: provider.languageCode == "ar"
                        ? MyThemeData.primaryColor
                        : MyThemeData.balckColor,
                    fontSize: 30,
                  ),
                ),
              ),

              if (provider.languageCode == "ar") ...[
                Icon(Icons.done, size: 35, color: MyThemeData.primaryColor),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
