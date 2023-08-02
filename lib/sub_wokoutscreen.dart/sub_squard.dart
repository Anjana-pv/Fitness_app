import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:workout2/screen/daily_screen.dart';
import 'package:workout2/workoutScreen/congradulation.dart';

import '../db/db_storeworkout.dart';
import '../models/data_model.dart';

class TimerScreen extends StatefulWidget {
  final List<String> imagePaths;
  final List<String> name;

  const TimerScreen({Key? key, required this.imagePaths, required this.name})
      : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int currentIndex = 0;
  bool hasNavigated = false;
  bool timerStarted = false;
    bool isPaused = false; 

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _animation = Tween<double>(begin: 0, end: 10).animate(_controller);
    _controller.forward();

    _startTimer();
  }

  void _startTimer() {
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (currentIndex < widget.imagePaths.length - 1 &&
            currentIndex < widget.name.length - 1) {
          setState(() {
            currentIndex++;
            _controller.reset();
            _controller.forward();
          });
        } else {
          if (currentIndex >= widget.imagePaths.length - 1 ||
              currentIndex >= widget.name.length - 1 && !hasNavigated) {
            hasNavigated = true;
        printWorkoutHistory(); 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Congrads()),
            );
          }
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
    setState(() {
      if (isPaused) {
        _controller.forward();
      } else {
        _controller.stop(); 
      }
      isPaused = !isPaused; 
//       if (hasCompletedSixWorkouts()) {
         
// } else {
//   // User has not completed 6 workouts yet
// }

    });
  }

void printWorkoutHistory() {
    final historyBox = Hive.box<WorkoutHistory>('workoutHistoryBox');
    final workoutHistory = historyBox.values.toList();

    print('Workout History:');
    for (var history in workoutHistory) {
      print('Workout completed: ${history.isCompleted}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const DailyScreen()),
                  );
                },
              ),
            ),
            Column(
              children: [
                SizedBox(height: 100),
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
                                            ? _animation.value / 10.0
                                            : 0.0,
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 175, 76, 162),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (!timerStarted)
                                    
                                    Positioned.fill(
                                      child: Center(
                                        child: Text(
                                          'Start',
                                          style: TextStyle(fontSize: 24,color: Color.fromARGB(255, 8, 110, 11)),
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
                      ),const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _handlePauseRestartTap,
                        child: Text(
                          isPaused ? 'Restart' : 'Pause',
                          style: TextStyle(fontSize: 18), ),
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
Future<void> saveWorkoutCompletion() async {
  final historyBox = Hive.box<WorkoutHistory>('workoutHistoryBox');
  historyBox.add(WorkoutHistory(true)); 
}

