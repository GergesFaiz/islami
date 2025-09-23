import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/models/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(model.index);
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(model.name)),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            padding: EdgeInsets.all(25),
            height: 652,
            width: 354,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(verses[index], textAlign: TextAlign.center);
              },
              itemCount: verses.length,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = sura.split("\n");
    verses = lines;
    setState(() {});
  }
}
