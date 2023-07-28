import 'package:flutter/material.dart';
import 'package:workout2/models/data_model.dart';

import 'package:workout2/screen/bmi_calcu.dart';

import '../db/new_db_functions.dart';

class Screenvitals extends StatefulWidget {
  Screenvitals({super.key});

  @override
  State<Screenvitals> createState() => _ScreenvitalsState();
}

class _ScreenvitalsState extends State<Screenvitals> {
  // double height = 0.0;
  // double weight = 0.0;
  // double age = 0.0;
  var bmi;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  var result;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Text(
                    "Enter your Height and Weight",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    'This helps us to know you more',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
                                  color:
                                      const Color.fromARGB(220, 226, 222, 222),
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
                                padding:
                                    const EdgeInsets.fromLTRB(50, 40, 20, 40),
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
                                  color:
                                      const Color.fromARGB(220, 226, 222, 222),
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
                                padding:
                                    const EdgeInsets.fromLTRB(50, 10, 20, 40),
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
                                  color:
                                      const Color.fromARGB(220, 226, 222, 222),
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
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 160, top: 60),
                    
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom:
                                  60.5), // Adjust the top padding as per your requirement
                          child: ElevatedButton(
                            onPressed: () {
                              if (heightController.text.isNotEmpty&&weightController.text.isNotEmpty&&agecontroller.text.isNotEmpty) {
                                addPersonalDataToModel();
                               
                              } else {
                                // addingfailed();
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double calculateBMI() {
    final _height = double.tryParse(heightController.text.trim()) ?? 0.0;
    final _weight = double.tryParse(weightController.text.trim()) ?? 0.0;
    print('$_height  $_weight');
    if (_height == 0.0 || _weight == 0.0) {
      return 0.0;
    }

    final double _bmi = _weight / ((_height / 100) * (_height / 100));
    return _bmi;
  }

  addPersonalDataToModel() async{
    PersonalDetails db = PersonalDetails(
   height: heightController.text, 
    weight: weightController.text, 
    age: agecontroller.text,
    );
final bmi = calculateBMI(); // Calculate the BMI here and store it in a variable

   await addpersonalDetail(db);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Beem(bmi: bmi.toStringAsFixed(2)), 
      ),
    );
  }

  
  addingfailed(){

    ScaffoldMessenger.of(context)
                               .showSnackBar(SnackBar(
                                  content: Text(
                                    'Please Enter All Data',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.red,
                                ));
  }
}

