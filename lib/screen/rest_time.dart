import 'package:flutter/material.dart';

class RestScreen extends StatefulWidget {
  const RestScreen({super.key});

  @override

  RestScreenState createState() => RestScreenState();
}

class RestScreenState extends State<RestScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _animation = Tween<double>(begin: 10, end: 0).animate(_controller);

    
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
       
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pop(context); 
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(''),fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Take Rest',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return SizedBox(
                    width: 150,
                    height: 150, 
                    child: CircularProgressIndicator(
                      value: _animation.value / 10.0,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 17, 170, 53),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Text(
                    _animation.value.toInt().toString() + " sec",
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

