import 'package:flutter/material.dart';

class Sub_screen extends StatefulWidget {
  const Sub_screen({super.key});

  @override
  State<Sub_screen> createState() => _Sub_screenState();
}

class _Sub_screenState extends State<Sub_screen> {
  final String backgroundImage = 'assest/image/assets/answall paper.jpg';
  final String congratulationsGif ='assest/image/assets/output-onlinegiftools.gif';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
               
               
                SizedBox(height: 60),

                Text(
                  ' You Have completed all Weeks',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                //  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
