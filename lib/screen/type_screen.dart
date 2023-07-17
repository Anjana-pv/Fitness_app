import 'package:flutter/material.dart';

import 'package:workout2/screen/advanced_screen.dart';
import 'package:workout2/screen/biggner.dart';

class TypeselectScreen extends StatefulWidget {
  TypeselectScreen({super.key});

  @override
  State<TypeselectScreen> createState() => _TypeselectScreenState();
}

class _TypeselectScreenState extends State<TypeselectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assest/image/assets/typ.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.5),
            child:  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                     
                    onTap: () {
                      // Handle onTap for 'Beginner'
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => BignnerScreen()),
                      );
                      
                    }  ,
                    
                 child: const Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Color.fromARGB(186, 9, 226, 190),
                      ),
                      Text(
                        'Bignner',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  ),
                  const SizedBox(height: 50),
               
                  GestureDetector(
                    onTap: () {
                      // Handle onTap for 'Advanced'
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => ScreenAdvanced()),
                      );
                    },
                


                  child:const Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Color.fromARGB(200, 200, 7, 110),
                      ),
                      Text(
                        'Advanced',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 40),
                  // Padding(padding: EdgeInsets.only(top: 80)),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.of(context).push(
                  //       MaterialPageRoute(builder: (ctx) => ScreenAdvanced()),
                  //     );
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Color.fromARGB(144, 10, 234, 73),
                  //     minimumSize: const Size(200, 50),
                  //   ),
                  //   child: const Text(
                  //     '    Next    ',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                   ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
