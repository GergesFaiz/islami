import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/home/hadeth_details.dart';
import 'package:islami/home/sura_details.dart';
import 'package:islami/models/hadeth_model.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/home/tabs/ahadeth_tab.dart';

class AhadethTab extends StatefulWidget {
  static const String routeName = "AhadethTab";

  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> ahadethData = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethData.isEmpty) {
      loadahadethFile();
    }

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
        Divider(thickness: 3, color: Color(0xffB7935F)),
        Text("الاحاديث", style: Theme.of(context).textTheme.bodyLarge),
        Divider(thickness: 3, color: Color(0xffB7935F)),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              endIndent: 50,
              indent: 50,
              color: Color(0xffB7935F),
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetails.routeName,arguments: HadethModel(title: ahadethData[index].title, content: ahadethData[index].content));
                },
                child: Text(
                  "${ahadethData[index].title}",
                  textAlign: TextAlign.center,
                ),
              );
            },
            itemCount: ahadethData.length,
          ),
        ),
      ],
    );
  }

  loadahadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((hadethFile) {
      List<String> ahadeth = hadethFile.split("#");
      for (int i = 0; i < ahadeth.length; i++) {
        String hadeth = ahadeth[i];
        List<String> hadethLines = hadeth.trim().split("\n");
        String hadethTitle = hadethLines[0];
        hadethLines.removeAt(0);
        List<String> hadethContent = hadethLines;
        ahadethData.add(
          HadethModel(title: hadethTitle, content: hadethContent),
        );
        setState(() {});
      }
    });
  }
}
