import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/sura_details/sura-details_provider.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = "SuraDetails";

  SuraDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;

    return ChangeNotifierProvider<SuraDetailsProvider>(
      create: (context) => SuraDetailsProvider()..loadFile(model.index),
      builder: (context, child) {
        var suraProvider = Provider.of<SuraDetailsProvider>(context);
       // suraProvider.loadFile(model.index);
       //  if (suraProvider.verses.isEmpty) {
       //    suraProvider.loadFile(model.index);
       //  }
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(provider.getBackgroundPath()),
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
                    return Text(suraProvider.verses[index], textAlign: TextAlign.center);
                  },
                  itemCount: suraProvider.verses.length,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
