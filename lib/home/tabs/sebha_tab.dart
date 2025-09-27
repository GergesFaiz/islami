import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = "Hosdssame";

  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  int tasbeehIndex = 0;
  List<String> tasbeehList = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  String tasbeehText = 'سبحان الله';

  void handleTasbeehTap() {
    setState(() {
      count++;
      if (count > 30) {
        count = 0;
        tasbeehIndex = (tasbeehIndex + 1) % tasbeehList.length;
        tasbeehText = tasbeehList[tasbeehIndex];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          // تركيب الرأس والجسم باستخدام Stack
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: InkWell(
                  onTap: handleTasbeehTap,
                  child: Image.asset(
                    "assets/images/body_of_seb7a.png",
                    height: 234,
                    width: 232,
                  ),
                ),
              ),
              Image.asset(
                "assets/images/head_of_seb7a.png",
                width: 73,
                height: 130,
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFFd4bfa0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              "$count",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFFB7935F),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              tasbeehText,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}