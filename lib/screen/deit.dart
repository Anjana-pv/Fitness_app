import 'package:flutter/material.dart';

import 'package:workout2/screen/type_screen.dart';

class Screendiet extends StatefulWidget {
  const Screendiet({super.key});

  @override
  State<Screendiet> createState() => _ScreendietState();
}

class _ScreendietState extends State<Screendiet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 400,
                  height: 40,
                  child: Text(
                    '                What’s Your diet type?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.02,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  width: 320,
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assest/image/assets/dinner 3.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 40,
                        right: 40,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Standard All Kinds of Food',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 320,
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assest/image/assets/vegg.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 40,
                        right: 90,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Vegetarian  Food',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                const Padding(padding: EdgeInsets.only(top: 90)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => TypeselectScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(112, 51, 168, 84),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    '    Next    ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}