import 'package:flutter/material.dart';

class TimerDialog extends StatefulWidget {
  const TimerDialog({super.key});

  @override
  TimerDialogState createState() => TimerDialogState();
}

class TimerDialogState extends State<TimerDialog> {
  int remainingSeconds = 10;
  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
          _startCountdown();
        } else {
          Navigator.of(context).pop();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(0, 205, 198, 198),
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assest/image/assets/answall paper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Rest for:',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              '$remainingSeconds seconds',
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
