import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/models/hadeth_model.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "HadethDetails";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getBackgroundPath()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(model.title,style: TextStyle(color: provider.getColorText(Colors.cyan)),)),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            height: MediaQuery.of(context).size.height * .7,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(model.content[index], textAlign: TextAlign.center,style: TextStyle(color: provider.getColorText(Colors.cyan)),);
              },
              itemCount: model.content.length,
            ),
          ),
        ),
      ),
    );
  }
}
