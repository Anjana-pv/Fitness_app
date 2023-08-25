import 'package:flutter/material.dart';

import 'package:workout2/screen/daily_screen.dart';

class BeginnerScreen extends StatefulWidget {
  const BeginnerScreen({Key? key}) : super(key: key);

  @override
  State<BeginnerScreen> createState() => _BeginnerScreen();
}

class _BeginnerScreen extends State<BeginnerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(199, 2, 100, 142),
          centerTitle: true,
          title: const Text(
            'Beginner',
            style: TextStyle(color: Colors.white),
          ),
          leading: null,
          
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assest/image/assets/biggner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final weekList = week[index];
                      if (index == 0) {
                        // Display start button for Week 1
                        return Card(
                          color: const Color.fromARGB(177, 155, 206, 240),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Text(weekList),
                            ),
                            trailing: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (ctx) => const DailyScreen(two: false, three: false, four: false, five: false, six: false,one: true,day1: false,day2: false,day3: false,day4: false,day5: false,day6: false,)),
                                );
                              },
                              child: const Text('Start'),
                            ),
                          ),
                        );
                      } else {
                      
                        return Card(
                          color: Colors.blueGrey.shade50,
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Row(
                                children: [
                                  Text(weekList),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ),
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
    );
  }

  List week = [
    'Week 1',
    'Week 2',
    'Week 3',
    'Week 4',
  ];
}
