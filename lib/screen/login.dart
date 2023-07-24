import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'package:workout2/screen/genter_screen.dart';
import 'package:workout2/screen/sign_in.dart';

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
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (ctx) =>FindGenderScreen()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(163, 51, 168, 84),
                            ),
                          ),
                          child: Text(
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
                            MaterialPageRoute(builder: (ctx) => const ScreenSignup()),
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

// Future<void> addDetailToModel() async {
//     final _username = _usernameController.text.trim();
//     final _password = _passwordController.text.trim();

//     if (_username.isEmpty || _password.isEmpty) {
//       return;
//     } else {
//        final workoutObject = WorkoutModel(
//          username: _username,
//          password: _password,
//        );
//   //  // setState((){
//     //  popDialogueBox();
//     }
    



  

  }





