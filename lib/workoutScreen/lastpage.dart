import 'package:flutter/material.dart';
import '../screen/daily_screen.dart';

class Lastpage extends StatelessWidget {
  const Lastpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assest/image/assets/week swich.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top:70, left: 20, right: 20),
              child: const Text(
                'You have completed 30 days of workout',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
             'assest/image/assets/output-onlinegiftools.gif',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                unlockworkout(context); 
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  void unlockworkout(BuildContext context) { 
    bool one = true;
    bool two = false;
    bool three = false;
    bool four = false;
    bool five = false;
    bool six = false;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => DailyScreen(
          five: five,
          four: four,
          six: six,
          three: three,
          two: two,
          one: one,
          day1: true,
          day2: false,
          day3: false,
          day4: false,
          day5: false,
          day6: false,
        ),
      ),
    );
  }
}
