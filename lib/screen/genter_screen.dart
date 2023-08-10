import 'package:flutter/material.dart';
import 'package:workout2/screen/vitals_screen.dart';
import '../db/db_genter.dart';
import '../models/data_model.dart';

class FindGenderScreen extends StatefulWidget {
  const FindGenderScreen({Key? key}) : super(key: key);

  @override
  State<FindGenderScreen> createState() => _FindGenderScreenState();
}

enum Gender { male, female, other }

String? selectedGender;

class _FindGenderScreenState extends State<FindGenderScreen> {
  void navigateToNextPageWithDelay() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Screenvitals()),
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
              const Padding(
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
              const SizedBox(
                height: 60,

              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = 'Male';
                    addGenterDetail();
                  });
                  navigateToNextPageWithDelay();
                },
                child: Card(
                  color: selectedGender == 'Male'
                      ? const Color.fromARGB(255, 146, 219, 146)
                      : null,
                  child: Column(
                    children: [
                      Image.asset(
                        'assest/male.png',
                        height: 200,
                        width: 200,
                      ),
                      const Text(
                        'Male',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              


              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = 'Female';
                    addGenterDetail();
                  });
                  navigateToNextPageWithDelay();
                },
                child: Card(
                  color: selectedGender == 'Female'
                      ? const Color.fromARGB(255, 138, 230, 138) // Selected color for Female
                      : null, // Default color for other genders
                  child: Column(
                    children: [
                      Image.asset(
                        'assest/fitness-woman-cartoon-_preview_rev_2.png',
                        height: 200,
                        width: 200,
                      ),
                      const Text(
                        'Female',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addGenterDetail() async {
    final genderObject = GenterDetails(
      id: DateTime.now().millisecond.toString(),
      genter: selectedGender!,
    );
    addgenterDetail(genderObject);
    print('$selectedGender');
  }
}
