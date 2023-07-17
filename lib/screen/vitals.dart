import 'package:flutter/material.dart';

import 'package:workout2/screen/bmi_screen.dart';


class Screenvitals extends StatefulWidget {
  const Screenvitals({super.key});

  @override
  State<Screenvitals> createState() => _ScreenvitalsState();
}

class _ScreenvitalsState extends State<Screenvitals> {
  double height = 0.0;
  double weight = 0.0;
  double age = 0.0;
  double bmi = 0.0;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController agecontroller = TextEditingController();

  double calculateBMI(double height, double weight) {
    double heightInMeters = height / 100; // convert height from cm to meters
    double bmi = weight / (heightInMeters * heightInMeters);
    return bmi;
  }

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
                        'Enter your Height and Weight',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'This helps us to know you more',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 40, 20, 40),
                                    child: const Text(
                                      'Height   :',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          220, 226, 222, 222),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: TextField(
                                      controller: heightController,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: 'cm',
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 40, 20, 40),
                                    child: const Text(
                                      'Weight  :',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          220, 226, 222, 222),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: TextField(
                                      controller: weightController,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: 'kg',
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 10, 20, 40),
                                    child: const Text(
                                      '     Age  :',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          220, 226, 222, 222),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: TextField(
                                      controller: agecontroller,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: '',
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 12.0,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 160, top: 80),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom:
                                      60.5), // Adjust the top padding as per your requirement
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (ctx) => const Bmiscreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(112, 51, 168, 84),
                                  minimumSize: const Size(150, 50),
                                ),
                                child: const Text(
                                  '    Next    ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
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
