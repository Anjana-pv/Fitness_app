import 'package:flutter/material.dart';

import 'package:workout2/body_focus/workout.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  SampleItem? selectedMenu;
  int _selectedIndex = 0;

  void onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(210, 155, 62, 192),
          title: const Text(
            'DAILY PLAN',
            style: TextStyle(color: Color.fromARGB(255, 221, 214, 214)),
          ),
        ),
        body: Column(
          children: [
            Card(
              child: Container(
                width: 350,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assest/image/assets/maxresdefault.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final weekList = week[index];
                        if (index == 0) {
                          // Display start button for Week 1
                          return Card(
                            color: const Color.fromARGB(238, 119, 68, 240),
                            child: ListTile(
                              title: Text(weekList),
                              subtitle: const Text(' 6 Exercises'),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (ctx) =>WorkoutScreen()),
                                  );
                                },
                                child: const Text('Start'),
                              ),
                            ),
                          );
                        } else {
                          // Display lock icon for other weeks
                          return Card(
                            color: Colors.blueGrey.shade50,
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text(weekList),
                                  const SizedBox(width: 10),
                                ],
                              ),
                              subtitle: const Text('6 Exercises'),
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
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: onitemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_dining_outlined,
                color: Colors.black,
              ),
              label: 'Recipies',
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
              label: 'Report',
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
