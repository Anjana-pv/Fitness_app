import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:workout2/screen/vitals.dart';

enum Gender { male, female }

class Screengenter extends StatefulWidget {
  const Screengenter({Key? key}) : super(key: key);

  @override
  _ScreengenterState createState() => _ScreengenterState();
}

class _ScreengenterState extends State<Screengenter> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Column(
                    children: [
                      const Text(
                        'Please select your gender',
                        style: TextStyle(
                          fontFamily: 'RobotoSerif',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Create a workout that suits you best',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 90),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedGender = Gender.female;
                                  });
                                },
                                child: Container(
                                  width: 118,
                                  height: 198,
                                  color: selectedGender == Gender.female
                                      ? Color.fromARGB(255, 16, 148, 19)
                                      : null,
                                  child: Image.asset(
                                    'assest/image/assets/female.jpg', // Replace with the path to the female image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 40),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedGender = Gender.male;
                                  });
                                },
                                child: Container(
                                  width: 118,
                                  height: 198,
                                  color: selectedGender == Gender.male
                                      ? Colors.blue
                                      : null,
                                  child: Image.asset(
                                    'assest/image/assets/img3.jpg', // Replace with the path to the male image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Female',
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(width: 10),
                              Text('Male',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                      const SizedBox(height: 60),
                    const Padding(padding: EdgeInsets.only(top: 90)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => const Screenvitals ()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(163, 51, 168, 84),
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
          ],
        ),
      ),
    );
  }
}
