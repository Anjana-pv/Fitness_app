import 'package:flutter/material.dart';
import 'package:workout2/body_focus/body.dart';



class BodyCongrads extends StatefulWidget {
  const BodyCongrads({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyCongrads> createState() => _BodyCongradsState();
}

class _BodyCongradsState extends State<BodyCongrads> {
  final String backgroundImage =
      'assest/image/assets/day1_images/pixel_3_wallpapers_droidviews-12.png';
  final String congratulationsGif =
      'assest/image/assets/output-onlinegiftools.gif';

  @override
 

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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Focus on your target area and 25% of your time',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 200),
                Image.asset(
                  congratulationsGif,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const BodySelection()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 232, 214, 248), 
                  ),
                  child: const Text('Go Back'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
