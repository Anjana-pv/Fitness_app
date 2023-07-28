import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Sqd extends StatefulWidget {
  const Sqd ({Key? key}) : super(key: key);

  @override
  _SqdState createState() => _SqdState();
}

class _SqdState extends State<Sqd> {
  late Duration _duration;
  late bool _isRunning;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _duration = Duration(seconds: 30);
    _isRunning = false;
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration.inSeconds == 0) {
          _isRunning = false;
          _timer.cancel();
        } else {
          _duration = Duration(seconds: _duration.inSeconds - 1);
        }
      });
    });
  }

  void _pauseTimer() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    _timer.cancel();
    setState(() {
      _duration = Duration(seconds: 30);
      _isRunning = false;
    });
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pause Timer'),
          content: Text('Do you want to reset or stop the timer?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'reset');
              },
              child: Text('Reset'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'stop');
              },
              child: Text('Stop'),
            ),
          ],
        );
      },
    ).then((value) {
      if (value == 'reset') {
        _resetTimer();
      } else if (value == 'stop') {
        _pauseTimer();
      }
    });
  }

  @override
  void dispose() {
    if (_isRunning) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              onPressed: () {
                Sqd();
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_rounded),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SQUATS',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assest/image/assets/day1_images/goblet-squad.gif', // Replace with the path to your image
                  width: 300,
                  height: 300,
                ),
                SizedBox(height: 40),
                Text(
                  '00:${_duration.inSeconds.toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _isRunning
                    ? ElevatedButton(
                        onPressed: () {
                          _showConfirmationDialog();
                        },
                        child: Text('Pause'),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _startTimer();
                          setState(() {
                            _isRunning = true;
                          });
                        },
                        child: Text('Start'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
