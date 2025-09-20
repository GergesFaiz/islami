import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/home/sura_model.dart';

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
    var model = ModalRoute
        .of(context)!
        .settings
        .arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(model.index);
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),fit: BoxFit.fill)),
        child: Scaffold(backgroundColor: Colors.transparent,
      appBar: AppBar(
      backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          model.name,
          style: GoogleFonts.elMessiri(
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(verses[index]);
        },
        itemCount: verses.length,
      ),
    ),);
  }

  Future<void> loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = sura.split("\n");
    verses = lines;
    setState(() {});
  }
}
