import 'package:flutter/material.dart';
import 'package:workout2/screen/adv_fullbody.dart';
import 'package:workout2/screen/advanced_screen.dart';

import 'package:workout2/screen/daily_screen.dart';

class TypeselectScreen extends StatefulWidget {
  const TypeselectScreen({super.key});

  @override
  State<TypeselectScreen> createState() => _TypeselectScreenState();
}

class _TypeselectScreenState extends State<TypeselectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assest/image/assets/typ.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (ctx) => const DailyScreen(
                                two: false,
                                three: false,
                                four: false,
                                five: false,
                                six: false,
                                one: true,
                                day1: false,
                                day2: false,
                                day3: false,
                                day4: false,
                                day5: false,
                                day6: false)),
                      );
                    },
                    child: const Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Color.fromARGB(233, 168, 8, 109),
                        ),
                        Text(
                          'Beginner',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  

                   
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (ctx) =>  const ScreenAdvanced
                            (  two: false,
                                three: false,
                                four: false,
                                five: false,
                                six: false,
                                one: true,
                                day1: false,
                                day2: false,
                                day3: false,
                                day4: false,
                                day5: false,
                                day6: false)),
                      
                          
                      );
                    },
                  
                
                   child:  const Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Color.fromARGB(184, 179, 220, 16),
                        ),
                        Text(
                          'Advanced',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
