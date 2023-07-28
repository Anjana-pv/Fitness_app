
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout2/db/db_genter.dart';
import 'package:workout2/db/db_signup_functions';
import 'package:workout2/db/new_db_functions.dart';
import 'package:workout2/db/targetweight_function.dart';

import 'package:workout2/models/data_model.dart';
import 'package:workout2/screen/login.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {

   int index;
   Profile(
      {super.key,
      required this.index
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
  TextEditingController _usercontoller =TextEditingController();
var bmi;
var data;
  @override
  void initState() {

     getalDatas();
      gettargetweight();

   _heightController = TextEditingController(text: personalListNotifier.value[0].height);
    _weightController = TextEditingController(text: personalListNotifier.value[0].weight);
    _ageController = TextEditingController(text: personalListNotifier.value[0].age);
    _genderController = TextEditingController(text: genterListNotifier.value[0].genter);
    _targetWeightController = TextEditingController(text: weighttarget.value[0].targetweight);
    _usercontoller=TextEditingController(text:signUpListNotifier.value[0].username );
       

    super.initState();
 
   
  }



  @override
  Widget build(BuildContext context) {
    getalDatas();
    gettargetweight();
    getallDetails();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 184, 56, 56),
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(255, 244, 245, 241),
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed:(){
              logout(context);
            }, icon: Icon(Icons.logout,color: Colors.white,))
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
              child: Text(
                'Hi ${_usercontoller.text}', // Displaying the "Hi" text with the username
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )
              ),
              SizedBox(height: 20),
              Card(
                color: Color.fromARGB(255, 254, 252, 249),
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
                        
                        decoration: InputDecoration(labelText: 'Focus part'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    update();
                  },
                  child: Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  update() async{
  
  PersonalDetails personalModel = PersonalDetails(
    height: _heightController.text,
    weight: _weightController.text,
    age: _ageController.text,
  );

  print("Updated Profile Data: $personalModel");

  await updatetohive(personalModel);
  
}


 logout(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('SignOut'),
            content: const Text('Do You Want To SignOut'),
            actions: [
              TextButton(
                  onPressed: () {
                    sighnout(context);
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  Future<void> sighnout(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.clear();

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const Screenlogin()), (route) => false);
  }
}
