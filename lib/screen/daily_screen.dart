import 'package:flutter/material.dart';
import 'package:workout2/body_focus/fullbody.dart';
import 'package:workout2/menu/celender.dart';
import 'package:workout2/menu/plan.dart';
import 'package:workout2/menu/profile.dart';
import 'package:workout2/menu/recipies.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Recipies()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Plan()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Calendar()),
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(210, 84, 7, 216),
          title: const Text(
            'DAILY PLAN',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w900,
            ),
          ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final weekList = week[index];
                        if (index == 0) {
                          // Display start button for Week 1
                          return Card(
                            color: const Color.fromARGB(192, 162, 131, 235),
                            child: ListTile(
                              title: Text('Day 1',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                              subtitle: const Text(' 6 Exercises',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => const WorkoutScreen(),
                                    ),
                                  );
                                },
                                child: const Text('Start'),
                              ),
                            ),
                          );
                        } else {
                          // Display lock icon for other weeks
                          return Card(
                            color: const Color.fromARGB(255, 211, 214, 216),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text(weekList),
                                  const SizedBox(width: 10),
                                ],
                              ),
                              subtitle: const Text('  6 Exercises'),
                              trailing: const Icon(Icons.lock),
                            ),
                          );
                        }
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                      itemCount: week.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Set the type to fixed
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

  List week = [
    ' Day 1',
    ' Day 2',
    ' Day 3',
    ' Day 4',
    ' Day 5',
    ' Day 6',
    ' Day 7',
  ];
}
