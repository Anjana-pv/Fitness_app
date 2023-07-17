import 'package:flutter/material.dart';

import 'package:workout2/screen/daily_screen.dart';

class ScreenAdvanced extends StatefulWidget {
  const ScreenAdvanced({Key? key}) : super(key: key);

  @override
  State<ScreenAdvanced> createState() => _ScreenAdvancedState();
}

class _ScreenAdvancedState extends State<ScreenAdvanced> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(200, 200, 7, 110),
          centerTitle: true,
          title: const Text(
            'Advanced',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350,

              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assest/image/assets/advance.jpg'),
                  fit: BoxFit.cover,
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
                            color: const Color.fromARGB(207, 236, 152, 188),
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Text(weekList),
                              ),
                              trailing: ElevatedButton(
                                onPressed: () {
                                   Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => DailyScreen()),
                      );
                                },
                                child: const Text('Start',style: TextStyle(color: Color.fromARGB(255, 77, 10, 5)),

                              ),
                            ),
                            ),
                          );
                        } else {
                          // Display lock icon for other weeks
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
