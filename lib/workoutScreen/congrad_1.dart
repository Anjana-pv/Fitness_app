

import 'package:flutter/material.dart';
import 'package:workout2/screen/daily_screen.dart';

// import 'package:workout2/sub_wokoutscreen.dart/week_2.dart';

class Congrads extends StatefulWidget {
  const Congrads({
    Key? key,
  }) : super(key: key);

  @override
  State<Congrads> createState() => _CongradsState();
}

class _CongradsState extends State<Congrads> {
  final String backgroundImage = 'assest/image/assets/123.jpg';
  final String congratulationsGif =
      'assest/image/assets/output-onlinegiftools.gif';

  @override
  void initState() {
    print('first one');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '"Crush your workout. Embrace the burn. Become unstoppable." 💪🔥',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 200),
                Image.asset(
                  congratulationsGif,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    unlockworkout();
                    
                  },
                  
                  child: const Text('Go Back '),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  unlockworkout() {
    bool one = false;
    bool two = true;
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
