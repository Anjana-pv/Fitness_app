import 'package:flutter/material.dart';
import 'package:workout2/models/data_model.dart';
import 'package:workout2/db/db_signup_functions';
import 'package:workout2/screen/genter_screen.dart';
//import 'package:shared_preferences/shared_preferences.dart';

//import 'package:workout2/screen/login.dart';

class ScreenSignup extends StatefulWidget {
  const ScreenSignup({super.key});

  @override
  State<ScreenSignup> createState() => _ScreenSignupState();
}

final TextEditingController _usernameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phonecontroller = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final _formkey = GlobalKey<FormState>();

class _ScreenSignupState extends State<ScreenSignup> {
  // bool _Matched = true;
  @override
  void initState() {
    getallDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assest/image/assets/img3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(30.5),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90.0),
                    color: Color.fromARGB(133, 238, 235, 235),
                  ),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '         Please enter your username';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90.0),
                    color: Color.fromARGB(133, 238, 235, 235),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    obscureText: true, // Mask the password text
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '          Please enter your password';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90.0),
                    color: Color.fromARGB(133, 238, 235, 235),
                  ),
                  child: TextFormField(
                    controller: _phonecontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '         Please enter your username';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 400,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90.0),
                    color: Color.fromARGB(133, 238, 235, 235),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '         Please enter your username';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                // Visibility(
                //   visible: !_Matched,
                //   child: Text(
                //     'username and Password do not match',
                //     style: TextStyle(
                //       color: Colors.red,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      addDetailToModel();
                    } else {
                      print('empty');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(163, 51, 168, 84),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> addDetailToModel() async {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phonecontroller.text.trim();
    final password = _passwordController.text.trim();
    if (username.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty) {
      return;
    } else {
      _usernameController.text = '';
      _emailController.text = '';
      _phonecontroller.text = '';
      _passwordController.text = '';

      final workoutObject = SignUpModel(
          id: DateTime.now().millisecond.toString(),
          username: username,
          email: email,
          phone: phone,
          password: password);
      addSignupDetail(workoutObject);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => Screengenter()),
      );
      print('$username $phone $email $password');
    }
  }
}
