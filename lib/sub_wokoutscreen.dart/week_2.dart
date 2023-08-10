import 'package:flutter/material.dart';
import 'package:workout2/body_focus/fullbody.dart';

import 'package:workout2/menu/celender.dart';

import 'package:workout2/menu/profile.dart';
import 'package:workout2/menu/recipies.dart';

import 'package:workout2/sub_wokoutscreen.dart/sub_screen.dart';
import 'package:workout2/sub_wokoutscreen.dart/week3.dart';


class week2 extends StatefulWidget {
  final bool two;
  final bool three;
  final bool four;
  final bool five;
  final bool six;
  final bool one;
  final bool day1;
  final bool day2;
  final bool day3;
  final bool day4;
  final bool day5;
  final bool day6;
  const week2(
      {super.key,
      required this.two,
      required this.three,
      required this.four,
      required this.five,
      required this.six,
      required this.one,
       required this.day1,
      required this.day2,
      required this.day3,
      required this.day4,
      required this.day5,
      required this.day6,});

  @override
  State<week2> createState() => week2State();
}

class week2State extends State<week2> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DietPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Calendar(date: false)),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BackButton()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(index: index),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // WorkoutHistory st = WorkoutHistory();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(210, 84, 7, 216),
          title: const Text(
            'DAILY PLAN',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w900,
            ),
          ),
          automaticallyImplyLeading: false,
          
         
          centerTitle: true,
         

        ),
        body: SingleChildScrollView(
          // Wrap the whole content inside SingleChildScrollView
          child: Column(
            children: [
              Card(
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assest/image/assets/maxresdefault.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Card(
                color: const Color.fromARGB(255, 153, 90, 234),
                child: ListTile(
                  title: const Text(
                    ' Day 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: const Text(
                    ' 6 Exercises', // Customize the subtitle
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => WorkoutScreen(click: 1)));
                    },
                    child: const Text('Start'),
                  ),
                ),

                //
              ),
              const SizedBox(
                height: 7,
              ),
              Card(
                color: widget.two
                    ? const Color.fromARGB(255, 153, 90, 234)
                    : const Color.fromARGB(255, 250, 252, 253),
                child: ListTile(
                    title: const Text(
                      ' Day 2',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      ' 6 Exercises', // Customize the subtitle
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: widget.two
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => WorkoutScreen(click: 2)));
                            },
                            child: const Text('Start'),
                          )
                        : const Icon(Icons.lock_outline)),
              ),
              const SizedBox(
                height: 7,
              ),
              Card(
                color: const Color.fromARGB(255, 247, 249, 251),
                child: ListTile(
                    title: const Text(
                      ' Day 3',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      ' 6 Exercises',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: widget.three
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => WorkoutScreen(click: 3)));
                            },
                            child: const Text('Start'),
                          )
                        : const Icon(Icons.lock_outline)),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: const Color.fromARGB(255, 242, 245, 248),
                child: ListTile(
                    title: const Text(
                      ' Day 4',
                      style: TextStyle(
                        color: Color.fromARGB(137, 9, 9, 9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      ' 6 Exercises', // Customize the subtitle
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: widget.four
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => WorkoutScreen(click: 4)));
                            },
                            child: const Text('Start'),
                          )
                        : const Icon(Icons.lock_outline)),
              ),
              const SizedBox(
                height: 7,
              ),
              Card(
                color: const Color.fromARGB(255, 239, 241, 243),
                child: ListTile(
                    title: const Text(
                      ' Day 5',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      ' 6 Exercises', // Customize the subtitle
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: widget.five
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => WorkoutScreen(click: 5)));
                            },
                            child: const Text('Start'),
                          )
                        : const Icon(Icons.lock_outline)),
              ),
              const SizedBox(height: 7),
              Card(
                color: const Color.fromARGB(255, 247, 249, 251),
                child: ListTile(
                    title: const Text(
                      ' Day 6',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      ' 6 Exercises', // Customize the subtitle
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: widget.six
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => WorkoutScreen(click: 6)));
                            },
                            child: const Text('Start'),
                          )
                        : const Icon(Icons.lock_outline)),
              ),
              const SizedBox(
                height: 7,
              ),
               GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => Week3(two: false, three: false, four: false, five: false, six: false, one: true,day1: false,day2: false,day3: false,day4: false,day5: false,day6: false)));
                },
                 child: const Card(
                  color: Color.fromARGB(255, 247, 249, 251),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'NEXT WEEK 3',
                        style: TextStyle(
                          color: Color.fromARGB(223, 126, 23, 216),
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                             ),
               ),
            ],
          ),
        ),
                          
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 183, 131, 246),
          type: BottomNavigationBarType.fixed, 
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_dining_outlined,
                color: Colors.black,
              ),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.offline_bolt_outlined,
                color: Colors.black,
              ),
              label: 'Plan',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.equalizer_rounded,
                color: Colors.black,
              ),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
        );
      
    
  }

  }

          