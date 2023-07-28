
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workout2/screen/daily_screen.dart';
import 'package:workout2/workoutScreen/squard.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _animation = Tween<double>(begin: 0, end: 10).animate(_controller);
    _controller.forward();
    Timer(Duration(seconds: 10), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => Sqd()),
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              onPressed: () {
               Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => Sqd()),);
              },
              icon: Icon(Icons.arrow_forward_ios_rounded),

            ),
           
            
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => DailyScreen()),
                );
              },
            ),
          ),
          Column(
            children: [
              SizedBox(height: 50),
              Text(
                "Let's begin ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assest/image/assets/day1_images/goblet-squad.gif',
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Ready to go',style: TextStyle(fontSize: 20,),),
                        ],
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Stack(
                              children: [
                                Center(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    child: CircularProgressIndicator(
                                      value: _animation.value / 10.0,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 175, 76, 162)),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      _animation.value.toInt().toString(),
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ),
                               
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
