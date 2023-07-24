

import 'package:flutter/material.dart';

import 'package:workout2/models/data_model.dart';

class Profile extends StatefulWidget {
  final String height;
  final String weight;
  final String age;
  final int index;
  final double bmi;

  const Profile(
      {super.key,
      required this.height,
      required this.weight,
      required this.age,
      required this.bmi,
      required this.index,
      });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _targetWeightController = TextEditingController();
var bmi;

  @override
  void initState() {
    super.initState();

    _heightController = TextEditingController(text: widget.height);
    _weightController = TextEditingController(text: widget.weight);
    _ageController = TextEditingController(text: widget.age);
    bmi=widget.bmi;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 35, 36, 35),
          title: Center(
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 28,
                color: Color.fromARGB(255, 244, 245, 241),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Hi Anjana',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                color: Color.fromARGB(255, 228, 227, 226),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _heightController,
                        decoration: InputDecoration(
                          labelText: 'Height (cm)',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _weightController,
                        decoration: InputDecoration(labelText: 'Weight (kg)'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _ageController,
                        decoration: InputDecoration(labelText: 'Age'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _genderController,
                        decoration: InputDecoration(labelText: 'Gender'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _targetWeightController,
                        decoration:
                            InputDecoration(labelText: 'Target Weight (kg)'),
                      ),
                      // Remove the last line separator by not adding Divider here
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Card(
                color: Color.fromARGB(255, 228, 227, 226),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Target area'),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _weightController,
                        decoration: InputDecoration(labelText: 'Focus part'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  updatetohive(context);
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updatetohive (ctx)async {
    final personalModel = PersonalDetails(
      id: DateTime.now().millisecond.toString(),
      height: _heightController.text,
      weight: _weightController.text,
      age: _ageController.text,
      bmi: bmi,
    );

    await updatetohive(personalModel);
  }
  
}
