import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = "Hosdssame";

  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}
bool isSubhan = true;
int count = 0;
int tasbeehIndex = 0;
List<String> tasbeehList = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
String tasbeehText = 'سبحان الله';


class _SebhaTabState extends State<SebhaTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/head_of_seb7a.png",
            width: 73,
            height: 105,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
              count++;
              if (count > 30) {
                count = 0;
                tasbeehIndex = (tasbeehIndex + 1) % tasbeehList.length;
                tasbeehText = tasbeehList[tasbeehIndex];
              }

            },
            child: Image.asset(
              "assets/images/body_of_seb7a.png",
              height: 234,
              width: 232,
            ),
          ),
          SizedBox(height: 25),
          Text("عدد التسبيحات", style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFFd4bfa0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$count",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFFB7935F),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(tasbeehText),
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
