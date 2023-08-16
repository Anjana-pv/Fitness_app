import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout2/body_focus/body.dart';
import 'package:workout2/db/focuspard.db.dart';
import 'package:workout2/menu/recipies.dart';
import 'package:workout2/screen/daily_screen.dart';

import '../db/db_genter.dart';
import '../db/db_signup_functions';
import '../db/new_db_functions.dart';
import '../db/targetweight_function.dart';
import '../models/data_model.dart';
import '../screen/login.dart';
import 'celender.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  int index;
  

  Profile({super.key, required this.index});

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
  var bmi;
  var data;
  var namenew = '';
  int  _selectedIndex = 4;

  @override
  void initState() {
    super.initState();
    initData();
    fetchName();
  }

  Future<void> initData() async {
    if (signUpListNotifier.value.isNotEmpty) {
      print("Username: ${signUpListNotifier.value[0].username}");
      userController.text = signUpListNotifier.value[0].username;
    }
    await getalDatas();

    await gettargetweight();
    await getallgenterDetails();
    await getallDetails();

    if (personalListNotifier.value.isNotEmpty) {
      userController.text = signUpListNotifier.value[0].username;
      heightController.text = personalListNotifier.value[0].height;
      weightController.text = personalListNotifier.value[0].weight;
      ageController.text = personalListNotifier.value[0].age;
      targetWeightController.text = personalListNotifier.value[0].weight;
    }

    if (genterListNotifier.value.isNotEmpty) {
      genderController.text = genterListNotifier.value[0].genter;
    }
    if (weighttarget.value.isNotEmpty) {
      print("Target Weight: ${weighttarget.value[0].targetweight}");
      targetWeightController.text = weighttarget.value[0].targetweight!;
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
  Widget buildBottomNavigationBar(int selectedIndex, void Function(int) onItemTapped) {
    return BottomNavigationBar(
      backgroundColor:   const Color.fromARGB(255, 145, 54, 175),
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 245, 243, 243),
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_dining_outlined,
            color: Color.fromARGB(255, 249, 248, 248),
          ),
          label: 'Recipes',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.offline_bolt_outlined,
            color: Color.fromARGB(255, 247, 246, 246),
          ),
          label: 'Plan',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Color.fromARGB(255, 247, 246, 246),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_month,
            color: Color.fromARGB(255, 252, 251, 251),
          ),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Color.fromARGB(255, 255, 254, 254),
          ),
          label: 'Profile',
        ),
      ],
    );
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
          actions: [
            IconButton(
              onPressed: () {
                logout(context);
              },
              icon: const Icon(Icons.logout, color: Colors.white),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
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
                  padding: const EdgeInsets.all(12.0),
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
                height: 20,
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
              const SizedBox(height: 20),
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
         bottomNavigationBar: buildBottomNavigationBar(_selectedIndex, (index) {
        setState(() {
          _selectedIndex = index;
        });

        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DietPage()),
            );
            break;
          case 1:
           
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BodySelection()),
        );
        break;
            
          case 2:
             Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const DailyScreen(
                                 two: false,
                                three: false,
                                four: false,
                                five: false,
                                six: false,
                                one: true,
                                day1: false,
                                day2: false,
                                day3: false,
                                day4: false,
                                day5: false,
                                day6: false)
          ),
        );
            break;
          case 3:
            Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Calendar(date: false)),
        );
        break;
    
           
          case 4:
             Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(index: index),
          ),
        );
        break;
        }
      }),
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

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => const Screenlogin()),
      (route) => false,
    );
  }
}
