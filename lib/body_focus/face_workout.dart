import 'package:flutter/material.dart';
import 'package:workout2/sub_wokoutscreen.dart/ten_sec.dart';

import '../body_congra.dart/cond.dart';

class Facescreen extends StatefulWidget{
  final List<String> imagePaths;
  final List<String> name;
  const Facescreen({
    super.key,
    required this.imagePaths,
    required this.name});

  @override
  State<Facescreen> createState() => _FacescreenState();
}
String? completed;
class _FacescreenState extends State<Facescreen> 
  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int currentIndex = 0;
  bool hasNavigated = false;
  bool timerStarted = false;
  bool isPaused = false;

  bool isResting = false;
  bool calmDown = true;

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
              if (calmDown) {
                showRestDialog();
              } else {
                startExercise();
              }

              currentIndex++;
            });
          } else {
            if (currentIndex >= widget.imagePaths.length - 1 ||
                currentIndex >= widget.name.length - 1 && !hasNavigated) {
              hasNavigated = true;

              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => const BodyCongrads()));
            }
          }
        } else {
           setState(() {
            isResting = false;
            if (currentIndex < widget.imagePaths.length) {
              isResting = true;
              _controller.duration = const Duration(seconds: 10);
              _controller.reset();
              _controller.forward();
            }
          });
        }
      }
    });
  }

void startExercise() {
    calmDown = true;
    _controller.duration = const Duration(seconds: 15);
    _controller.reset();
    _controller.forward();
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

  
  }
   void showRestDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text(
            'Exercise Completed',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
              'Take Rest for 10 seconds or Skip to next exercise?',
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 24, 24, 24),
          actions: <Widget>[
            TextButton(
              child: const Text('Take Rest',style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const TimerDialog()),
                );
              },
            ),
            TextButton(
              child: const Text('Skip',style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                startExercise();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 80),
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
                  height: 40,
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
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: _handlePauseRestartTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 186, 132, 245), 
                        ),
                        child: Text(
                          isPaused ? 'Restart' : 'Pause',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white), 
                      )
                      ),
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
}
