import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:workout2/db/targetweight_function.dart';
import 'package:workout2/models/data_model.dart';
import 'package:workout2/screen/type_screen.dart';

class Beem extends StatefulWidget {
  final String bmi;
  const Beem({super.key, required this.bmi});

  @override
  State<Beem> createState() => _BeemState();
}

class _BeemState extends State<Beem> {
  late String bmiStatus;

  @override
  void initState() {
    super.initState();
    bmiStatus = getBMIStatus(double.parse(widget.bmi));
  }

  String getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25.0) {
      return 'Normal';
    } else if (bmi >= 25.0 && bmi < 30.0) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  double getBMICategoryThreshold(String category) {
    switch (category) {
      case 'Underweight':
        return 18.5;
      case 'Normal':
        return 25.0;
      case 'Overweight':
        return 30.0;
      case 'Obicity':
        return 70.0;
      default:
        return 100.0;
    }
  }

  String getEmojiText(String status) {
    switch (status) {
      case 'Underweight':
        return '😔 Underweight';
      case 'Normal':
        return '😄 Normal';
      case 'Overweight':
        return '😐 Overweight';
      case 'Obesity':
        return '😔 Obesity';
      default:
        100;
        return '';
    }
  }

  TextEditingController targetWeightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Let's Find your BMI",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Rancho',
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 35),
                Column(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 300,
                            height: 300,
                            padding: const EdgeInsets.all(10),
                            child: KdGaugeView(
                              minSpeed: 0,
                              maxSpeed: 100,
                              speed: double.parse(widget.bmi),
                              animate: true,
                              duration: const Duration(seconds: 5),
                              alertSpeedArray: [
                                double.parse(widget.bmi),
                                getBMICategoryThreshold('Underweight'),
                                getBMICategoryThreshold('Normal'),
                                getBMICategoryThreshold('Overweight'),
                                // getBMICategoryThreshold('Obicity')
                              ],
                              alertColorArray: const [
                                Colors.yellow,
                                Colors.green,
                                Colors.orange,
                                Colors.red
                              ],
                              unitOfMeasurement: "Bmi",
                              gaugeWidth: 20,
                              fractionDigits: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              getEmojiText(bmiStatus),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Your Destination weight',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 40, 20, 40),
                              child: const Text(
                                'Weight    :',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: 90,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(220, 226, 222, 222),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: TextField(
                                controller: targetWeightController,
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
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            addingtarget();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(131, 22, 148, 57),
                            minimumSize: const Size(150, 50),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addingtarget() {
    Targetweight st = Targetweight(targetweight: targetWeightController.text);

    addfunction(st);

    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => TypeselectScreen()),
    );
  }
}
