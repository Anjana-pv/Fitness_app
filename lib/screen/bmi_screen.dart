import 'package:flutter/material.dart';

import 'package:workout2/body_focus/body.dart';
import 'package:workout2/screen/advanced_screen.dart';
import 'package:workout2/screen/deit.dart';

class Bmiscreen extends StatefulWidget {
  final String bmi;
  const Bmiscreen({super.key, required this.bmi});

  @override
  State<Bmiscreen> createState() => _BmiscreenState();
}

class _BmiscreenState extends State<Bmiscreen> {
  late String bmiStatus;

  @override
  void initState() {
    super.initState();
    bmiStatus = getBMIStatus(double.parse(widget.bmi));
  }


  String getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25.0) {
      return 'Normal';
    } else if (bmi >= 25.0 && bmi < 30.0) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }
  
IconData getBMIStatusIcon(String status) {
  switch (status) {
    case 'Underweight':
      return Icons.sentiment_very_dissatisfied_sharp;
    case 'Normal':
      return Icons.sentiment_satisfied;
    case 'Overweight':
      return Icons.sentiment_neutral;
    case 'Obesity':
      return Icons.sentiment_very_dissatisfied_sharp;
    default:
      return Icons.sentiment_satisfied;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  width: 400,
                  height: 40,
                  child: Text(
                    "                    Let's Find your BMI",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Rancho',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 350,
                          height: 160,
                          color: const Color.fromARGB(255, 222, 218, 218),
                          child: const Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text(
                                'BMI',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120,



                          top: 60,

                          child: Container(
                            width: 200,
                            height: 10,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(1.00, 0.00),
                                end: Alignment(-1, 0),
                                colors: [
                                  Color(0xE0F70D0D),
                                  Color.fromARGB(255, 237, 137, 8),
                                  Color.fromARGB(234, 250, 238, 64),
                                  Color.fromARGB(238, 69, 180, 5),
                                  Color.fromARGB(255, 22, 180, 223),
                                  Color.fromARGB(255, 22, 180, 223),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 70),
                            Text(
                              widget.bmi,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                           
                            Padding(
                              padding: const EdgeInsets.only(left: 130), 
                              child: Row(

                                
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color.fromARGB(255, 223, 225, 98),
                                    child: Icon(
                                      getBMIStatusIcon(bmiStatus),
                                      color: Color.fromARGB(255, 17, 17, 2),
                                      size: 24,


                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    bmiStatus,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Your Destination weight',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 40, 20, 40),
                              child: const Text(
                                'Weight    :',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: 90,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(220, 226, 222, 222),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const TextField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'kg',
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal: 12.0,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (ctx) =>Screendiet()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(131, 22, 148, 57),
                            minimumSize: const Size(150, 50),
                          ),
                          child: const Text(
                            '    Next    ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
