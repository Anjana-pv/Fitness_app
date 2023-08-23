import 'package:flutter/material.dart';

class Subscreen extends StatefulWidget {
  const Subscreen({super.key});

  @override
  State<Subscreen> createState() => SubscreenState();
}

class SubscreenState extends State<Subscreen> {
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
