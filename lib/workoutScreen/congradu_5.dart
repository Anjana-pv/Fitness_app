

import 'package:flutter/material.dart';

import 'package:workout2/screen/daily_screen.dart';


class Congrads5 extends StatefulWidget {
  
   const Congrads5({Key? key,}) : super(key: key);

  @override
  State<Congrads5> createState() => _Congrads5State();

}


class _Congrads5State extends State<Congrads5> {
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
                  '"Progress is made one step at a time.🔥',
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

  unlockworkout(){
    bool one = false;

    bool two = false;
      bool three = false;
    bool four = false;
     bool five = false;
      bool six = true;


     Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) =>  DailyScreen(five: five,four: four,six: six,three: three,two: two,one: one,day1: true,day2: true,day3: true,day4: true,day5: true,day6: true,),
                        
                      ),
                      );
  }
}
