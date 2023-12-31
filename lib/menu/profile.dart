import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../db/db_genter.dart';
import '../db/db_signup_functions';
import '../db/focuspard.db.dart';
import '../db/new_db_functions.dart';
import '../db/targetweight_function.dart';
import '../models/data_model.dart';
import '../screen/splash_screen.dart';






class Profile extends StatefulWidget {

  

  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController targetWeightController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController focusareacntroller = TextEditingController();
var  bmi;
  var data;
  var namenew = '';


  @override
  void initState() {
    super.initState();
    initData();
    fetchName();
  }

  Future<void> initData() async {
    if (signUpListNotifier.value.isNotEmpty) {
      print("Username: ${signUpListNotifier.value.last.username}");
      userController.text = signUpListNotifier.value.last.username;
    }
    await getalDatas();
    await gettargetweight();
    await getallgenterDetails();
    await getallDetails();

    if (personalListNotifier.value.isNotEmpty) {
      userController.text = signUpListNotifier.value.last.username;
      heightController.text = personalListNotifier.value.last.height;
      weightController.text = personalListNotifier.value.last.weight;
      ageController.text = personalListNotifier.value.last.age;
      targetWeightController.text = personalListNotifier.value.last.weight;
    }

    if (genterListNotifier.value.isNotEmpty) {
      genderController.text = genterListNotifier.value.last.genter;
    }
    if (weighttarget.value.isNotEmpty) {
    
      targetWeightController.text = weighttarget.value.last.targetweight!;
      
    }
  }

  Future<void> fetchName() async {
    final db = FocusDB();
    final focusList = await db.getallfocusdatas();
    if (focusList.isNotEmpty) {
      setState(() {
        namenew = focusList.last.name.toString();
      });
    }
  }
  

  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 176, 56, 184),
        title: const Text(
          'PROFILE',
          style: TextStyle(
            fontSize: 26,
            color: Color.fromARGB(255, 244, 245, 241),
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
       leading: IconButton(
          color: const Color.fromARGB(255, 246, 240, 240),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  ' ${userController.text}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                color: const Color.fromARGB(255, 241, 240, 238),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: heightController,
                        decoration: const InputDecoration(
                          labelText: 'Height (cm)',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: weightController,
                        decoration:
                            const InputDecoration(labelText: 'Weight (kg)'),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: ageController,
                        decoration: const InputDecoration(labelText: 'Age'),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: genderController,
                        decoration: const InputDecoration(labelText: 'Gender'),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: targetWeightController,
                        decoration: const InputDecoration(
                            labelText: 'Target Weight (kg)'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                color: const Color.fromARGB(255, 247, 243, 239),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Selected Focus Part',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '- $namenew',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    update();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 182, 66, 236)),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
            
          ),
          
        ),
      
      ),
    );
  }

  update() async {
    PersonalDetails personalModel = PersonalDetails(
      height: heightController.text,
      weight: weightController.text,
      age: ageController.text,
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
          content: const Text('Are you sure'),
          actions: [
            TextButton(
              onPressed: () {
                signOut(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  Future<void> signOut(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.clear();
     setState(() {
       userController.text = '';
      heightController.text = '';
      weightController.text = '';
      ageController.text = '';
      genderController.text = '';
      targetWeightController.text = '';
      namenew = '';
    });


    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => const SplashScreen()),
      (route) => false,
    );
  }
}
