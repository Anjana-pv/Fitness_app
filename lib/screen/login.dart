import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:workout2/db/db_signup_functions';

import 'package:workout2/screen/daily_screen.dart';
import 'package:workout2/screen/sign_in.dart';

import '../models/data_model.dart';



class Screenlogin extends StatefulWidget {
  const Screenlogin({super.key});

  @override
  State<Screenlogin> createState() => _ScreenloginState();
}

class _ScreenloginState extends State<Screenlogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    loginagain();
    super.initState();
    //  checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assest/image/assets/img2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.5),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      children: [
                        Container(
                          width: 400,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90.0),
                            color: const Color.fromARGB(133, 238, 235, 235),
                          ),
                          child: TextFormField(
                            controller: _usernameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '         Please enter your username';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Username',
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 400,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90.0),
                            color: const Color.fromARGB(133, 238, 235, 235),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '         Please enter your password';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              loginagain();
                            } else {
                              print('empty');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(163, 51, 168, 84),
                            ),
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (ctx) => const ScreenSignup()),
                          );
                        },
                        child: const Text(
                          'New user? Sign up',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 248, 245, 245),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

 Future loginagain() async {
  final signUpDB = await Hive.openBox<SignUpModel>('signUp_db');
  final username = _usernameController.text.trim();
  final password = _passwordController.text.trim();

  final user = signUpListNotifier.value.firstWhere(
    (element) => element.username == username && element.password == password,
   
  );

  if (user != true) {

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) => const DailyScreen(
        five: false,
        four: false,
        six: false,
        three: false,
        two: false,
        one: true,
        day1: false,
        day2: false,
        day3: false,
        day4: false,
        day5: false,
        day6: false,
      ),
    ));
  }
}
}