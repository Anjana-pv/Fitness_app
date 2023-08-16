import 'package:flutter/material.dart';
import 'package:workout2/sub_wokoutscreen.dart/week_2.dart';
import 'package:workout2/workoutScreen/2_congradulation.dart';
import 'package:workout2/workoutScreen/3_congradulations.dart';
import 'package:workout2/workoutScreen/4_congradulation.dart';
import 'package:workout2/workoutScreen/5_congradulation.dart';
import 'package:workout2/workoutScreen/6_congradulation.dart';
import 'package:workout2/workoutScreen/1_congradulation.dart';

import '../screen/rest_time.dart';


// ignore: must_be_immutable
class TimerScreen extends StatefulWidget {
  final List<String> imagePaths;
  final List<String> name;
  int click;

  TimerScreen(
      {Key? key,
      required this.imagePaths,
      required this.click,
      required this.name})
      : super(key: key);

  @override
  TimerScreenState createState() => TimerScreenState();
}

String? completed;

class TimerScreenState extends State<TimerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int currentIndex = 0;
  bool hasNavigated = false;
  bool timerStarted = false;
  bool isPaused = false;

bool isResting = false;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    );

    _animation = Tween<double>(begin: 0, end: 15).animate(_controller);
    _controller.forward();

    _startTimer();
  }

  void _startTimer() {
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
         if (!isResting) {
        if (currentIndex < widget.imagePaths.length - 1 &&
            currentIndex < widget.name.length - 1) {
          setState(() {
            currentIndex++;
            _controller.reset();
            _controller.forward();
          });
        
         
        
       }
        else {
          if (currentIndex >= widget.imagePaths.length - 1 ||
              currentIndex >= widget.name.length - 1 && !hasNavigated) {
            hasNavigated = true;

            navigat();
          }
        }
      } else {
          setState(() {
            isResting = false;
            currentIndex++;
            if (currentIndex < widget.imagePaths.length) {
            _controller.reset();
            _controller.forward();
            }
          });
        }
      }
    
  });
}
  void _handleStartTap() {
    setState(() {
      timerStarted = true;
      _controller.reset();
      _controller.forward();
    });
  }

  void _handlePauseRestartTap() {
    if (isPaused) {
      _controller.forward();
    } else {
      _controller.stop();
    }

    setState(() {
      isPaused = !isPaused;
    });

    {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    widget.name[currentIndex],
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        widget.imagePaths[currentIndex],
                        width: 300,
                        height: 300,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ready to go',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: _handleStartTap,
                          child: AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Stack(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: CircularProgressIndicator(
                                        value: timerStarted
                                            ? _animation.value / 15.0
                                            : 0.0,
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 175, 76, 162),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (!timerStarted)
                                    const Positioned.fill(
                                      child: Center(
                                        child: Text(
                                          'Start',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Color.fromARGB(
                                                  255, 8, 110, 11)),
                                        ),
                                      ),
                                    ),
                                  if (timerStarted)
                                    Positioned.fill(
                                      child: Center(
                                        child: Text(
                                          _animation.value.toInt().toString(),
                                          style: const TextStyle(fontSize: 24),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _handlePauseRestartTap,
                        child: Text(
                          isPaused ? 'Restart' : 'Pause',
                          style: const TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  navigat() {
    if (widget.click == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const Congrads()));
    } else if (widget.click == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const Congrads1()));
    } else if (widget.click == 3) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const Congrads2()));
    } else if (widget.click == 4) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => Congrads3()));
    } else if (widget.click == 5) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => Congrads5()));
    } else if (widget.click == 6) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => Congrads6()));
    } else if (widget.click == 7) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => const week2(
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
                day6: false,
              )));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
