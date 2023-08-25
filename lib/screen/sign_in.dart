import 'package:flutter/material.dart';
import 'package:workout2/main.dart';
import 'package:workout2/models/data_model.dart';
import 'package:workout2/db/db_signup_functions';
import 'package:workout2/screen/genter_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  DateTime date = DateTime.now();
  bool matched = true;
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assest/image/assets/imagg333 (1).jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                
                Container(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '         Please enter your username';
                      } else {
                        return null;
                      }
                    },
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
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    obscureText: true, // Mask the password text
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.mail),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '          Please enter your Email';
                      } else {
                        return null;
                      }
                    },
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
                    keyboardType: TextInputType.phone,
                    controller: _phonecontroller,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone',
                      prefixIcon: Icon(Icons.phone),
                      counterText: '',
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length != 10) {
                        return '         Please enter your Phonenumber';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 400,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90.0),
                    color: const Color.fromARGB(133, 238, 235, 235),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '         Please enter your Password';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Visibility(
                  visible: !matched,
                  child: const Text(
                    'username and Password do not match',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
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
                      const Color.fromARGB(163, 51, 168, 84),
                    ),
                  ),
                  child: const Text(
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
    SignUpModel workoutObject = SignUpModel(
        id: DateTime.now().millisecond.toString(),
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phonecontroller.text.trim(),
        password: _passwordController.text.trim(),
        date: date.toString());

    addSignupDetail(workoutObject);

    final sharedata = await SharedPreferences.getInstance();
    await sharedata.setBool(savekey, true);

    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const FindGenderScreen()),
    );
  }
}
