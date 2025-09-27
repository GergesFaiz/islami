import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../models/hadeth_model.dart';

class HadethDetailsProvider extends ChangeNotifier {

  List<HadethModel> ahadethData = [];
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
       notifyListeners();
      }
    });
  }
}