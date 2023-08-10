import 'package:flutter/material.dart';
import 'package:workout2/models/data_model.dart';

import 'package:workout2/screen/bmi_calcu.dart';

import '../db/new_db_functions.dart';

class Screenvitals extends StatefulWidget {
  const Screenvitals({super.key});

  @override
  State<Screenvitals> createState() => _ScreenvitalsState();
}

class _ScreenvitalsState extends State<Screenvitals> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80 ),  
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  const Text(
                    "Enter your Height and Weight",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              const Text(
                'This helps us to know you more',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Height   :',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(width: 10,),
                            Container(
                              width: 90,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(220, 226, 222, 222),
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
                        const SizedBox(height: 50),   
                        Row(
                          children: [
                            const Text(
                              'Weight  :',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              width: 90,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(220, 226, 222, 222),
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
                        const SizedBox(height: 50), 
                        Row(
                          children: [
                            const Text(
                              '     Age  : ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              width: 90,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(220, 226, 222, 222),
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
              ),
              const SizedBox(height: 50), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                    Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (heightController.text.isNotEmpty &&
                            weightController.text.isNotEmpty &&
                            agecontroller.text.isNotEmpty) {
                          addPersonalDataToModel();
                        } else {
                           addingfailed();
                        }
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
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI() {
    final height = double.tryParse(heightController.text.trim()) ?? 0.0;
    final weight = double.tryParse(weightController.text.trim()) ?? 0.0;
    print('$height  $weight');
    if (height == 0.0 || weight == 0.0) {
      return 0.0;
    }

    final double bmi = weight / ((height / 100) * (height / 100));
    print('$bmi');
    return bmi;
  }

  addPersonalDataToModel() async {
    PersonalDetails db = PersonalDetails(
      height: heightController.text,
      weight: weightController.text,
      age: agecontroller.text,
    );
    final bmi =
        calculateBMI(); // Calculate the BMI here and store it in a variable

    await addpersonalDetail(db);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Beem(bmi: bmi.toStringAsFixed(2)),
      ),
    );
  }

  addingfailed() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        'Please Enter All Data',
        style: TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
    ));
  }
}
