import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  CountDownController _controller = CountDownController();
  bool isRelaxing = false;
  bool isPaused = false;

  int getTimerDuration() {
    return isRelaxing ? 10 : 15; 
  }

  Color getTimerFillColor() {
    return isRelaxing ? Color.fromARGB(255, 232, 49, 49) : Color.fromARGB(255, 49, 79, 232);
  }

  String getModeText() {
    return isRelaxing ? 'Relax!!!' : 'Focus';
  }

  void togglePauseAndRestart() {
    setState(() {
      if (!isPaused) {
        _controller.pause();
      } else {
        _controller.resume();
      }

      if (!isRelaxing) {
        isRelaxing = true;
        _controller.restart(duration: 10); 
      }

      isPaused = !isPaused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 27, 27, 26),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/your_image.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularCountDownTimer(
                    width: 200,
                    height: 200,
                    duration: getTimerDuration(),
                    fillColor: getTimerFillColor(),
                    ringColor: const Color.fromARGB(255, 249, 248, 248),
                    controller: _controller,
                    backgroundColor: Color.fromARGB(255, 172, 172, 169),
                    strokeWidth: 10.0,
                    strokeCap: StrokeCap.round,
                    isTimerTextShown: true,
                    isReverse: false,
                    onComplete: () {
                      togglePauseAndRestart();
                    },
                  ),
                  Text(
                    getModeText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 105, 224, 109),
                      fontSize: 40,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: togglePauseAndRestart,
                    child: Text(isPaused ? "Resume" : "Pause"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
