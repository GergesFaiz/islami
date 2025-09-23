import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/models/hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "HadethDetails";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute
        .of(context)!
        .settings
        .arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(25)),
          height: MediaQuery
              .of(context)
              .size
              .height * .7,
          child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(model.content[index]);
              }, itemCount: model.content.length),
                ),
        ),),);
  }
}
