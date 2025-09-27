import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/My_Theme.dart';
import 'package:islami/hadeth_details/hadeth_details.dart';
import 'package:islami/hadeth_details/hadeth_details_provider.dart';
import 'package:islami/sura_details/sura_details.dart';
import 'package:islami/models/hadeth_model.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/home/tabs/ahadeth_tab.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

class AhadethTab extends StatelessWidget {
  AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HadethDetailsProvider>(
      create: (context) => HadethDetailsProvider()..loadahadethFile(),
      builder: (context, child) {
        var hadethProvider = Provider.of<HadethDetailsProvider>(context);
        // if (hadethProvider.ahadethData.isEmpty) {
        //   hadethProvider.loadahadethFile();
        // }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/hadith_header.png",
                  width: 312,
                  height: 219,
                ),
              ],
            ),
            Divider(thickness: 3, color: MyThemeData.primaryColor),
            Text(
              AppLocalizations.of(context)!.ahadeth,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Divider(thickness: 3, color: MyThemeData.primaryColor),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  endIndent: 50,
                  indent: 50,
                  color: MyThemeData.primaryColor,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        HadethDetails.routeName,
                        arguments: hadethProvider.ahadethData[index],
                      );
                    },
                    child: Text(
                      "${hadethProvider.ahadethData[index].title}",
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                itemCount: hadethProvider.ahadethData.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
