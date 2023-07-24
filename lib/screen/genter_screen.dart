import 'package:flutter/material.dart';
import 'package:workout2/screen/vitals.dart';

import '../db/db_genter.dart';

import '../models/data_model.dart';

class FindGenderScreen extends StatefulWidget {
  const FindGenderScreen({Key? key}) : super(key: key);

  @override
  State<FindGenderScreen> createState() => _FindGenderScreenState();
}

enum Gender { male, female, other }

Gender? selectedGender;

class _FindGenderScreenState extends State<FindGenderScreen> {
  void navigateToNextPageWithDelay() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Screenvitals()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: Column(
                  children: [
                    Text(
                      'Please select your gender',
                      style: TextStyle(
                        fontFamily: 'RobotoSerif',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Create a workout that suits you best',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                    addGenterDetail();
                  });
                   navigateToNextPageWithDelay();
                },
                child: Card(
                  color: selectedGender == Gender.male
                                      ? Color.fromARGB(255, 136, 180, 136)
                                      : null,
                    child: Column(
                  children: [
                    
                    Image.asset(
                      'assest/male.png',
                      height: 200,
                      width: 200,

                       
                    ),
                    Text(
                      'Male',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ],
                )),
              ),
              SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                    addGenterDetail();
                  });
                    navigateToNextPageWithDelay(); 
                },
                child: Card(
                  color: selectedGender == Gender.female
                                      ?Color.fromARGB(255, 136, 180, 136)
                                      : null,
                    child: Column(
                  children: [
                    Image.asset(
                      'assest/fitness-woman-cartoon-_preview_rev_2.png',
                      height: 200,
                      width: 200,
                      
                    ),
                    Text(
                      'Female',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Future<void> addGenterDetail() async {
final genderObject = GenterDetails(id: DateTime.now().millisecond.toString(), genter: selectedGender.toString());
      addgenterDetail(genderObject);
      print('$selectedGender');
  }
