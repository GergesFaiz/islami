import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/My_Theme.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

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
                  provider.changTheme(ThemeMode.light);
                },
                child: Text(
                  'Light',
                  style: TextStyle(
                    color: provider.themeMode == ThemeMode.light
                        ? MyThemeData.primaryColor
                        : MyThemeData.balckColor,
                    fontSize: 30,
                  ),
                ),
              ),
              if (provider.themeMode == ThemeMode.light) ...[
                Icon(Icons.done, size: 35, color: MyThemeData.primaryColor),
              ],
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  provider.changTheme(ThemeMode.dark);
                },
                child: Text(
                  'Dark',
                  style: TextStyle(
                    color: provider.themeMode == ThemeMode.dark
                        ? MyThemeData.primaryColor
                        : MyThemeData.balckColor,
                    fontSize: 30,
                  ),
                ),
              ),

              if (provider.themeMode == ThemeMode.dark) ...[
                Icon(Icons.done, size: 35, color: MyThemeData.primaryColor),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
