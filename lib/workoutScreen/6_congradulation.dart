import 'package:flutter/material.dart';


import 'package:workout2/sub_wokoutscreen.dart/week_2.dart';

class Congrads6 extends StatefulWidget {
  Congrads6({
    Key? key,
  }) : super(key: key);

  @override
  State<Congrads6> createState() => _Congrads6State();
}

class _Congrads6State extends State<Congrads6> {
  final String backgroundImage = 'assest/image/assets/123.jpg';
  final String congratulationsGif =
      'assest/image/assets/output-onlinegiftools.gif';

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
                  '"Embrace the challenge, and watch yourself grow"',
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
                  'Congratulations! ',
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
                  child: const Text('Go Back to Home'),
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
  bool two = false;
  bool three = false;
  bool four = false;
  bool five = false;
  bool six = false;


  
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => week2(
          one: one,
          two: two,
          three: three,
          four: four,
          five: five,
          six: six,
          day1: true,
          day2: true,
          day3: true,
          day4: true,
          day5: true,
          day6: true,
        ),
      ),
    );
  
}
}