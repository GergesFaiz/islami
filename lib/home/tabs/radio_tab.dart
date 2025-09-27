import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 150),
            Image.asset('assets/images/radio.png', width: 412, height: 222),
            const SizedBox(height: 50),
             Text(
              'إذاعة القرآن الكريم',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 50),
            Image.asset('assets/images/PlaySound.png'),
          ],
        ),
      ),
    );
  }
}
