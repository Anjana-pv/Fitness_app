import 'package:flutter/material.dart';

import 'package:workout2/screen/daily_screen.dart';

// ignore: must_be_immutable
class Congrads2 extends StatefulWidget {
  
   const Congrads2({Key? key}) : super(key: key);

  @override
  State<Congrads2> createState() => _Congrads2State();

}


class _Congrads2State extends State<Congrads2> {
  final String backgroundImage = 'assest/image/assets/123.jpg'; 
  final String congratulationsGif = 'assest/image/assets/output-onlinegiftools.gif';
  

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
                  '"Believe in the power of your potential."',
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
                    
                        child: const Text('Go Back to Home'),
                      
                      ),
                    ],

              
            ),
          ),
        ],
      ),
    );
  }

  unlockworkout(){
    bool one = false;
    bool two = false;
      bool three = false;
    bool four = true;
     bool five = false;
      bool six = false;


     Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) =>  DailyScreen(five: five,four: four,six: six,three: three,two: two,one: one,day1: true,day2: true,day3: true,day4: false,day5: false,day6: false,),
                        
                      ),
                      );
  }
}
