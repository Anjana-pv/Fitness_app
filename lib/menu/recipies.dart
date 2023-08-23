import 'package:flutter/material.dart';
import 'package:workout2/body_focus/body.dart';
import 'package:workout2/menu/celender.dart';
import 'package:workout2/menu/mine.dart';
import 'package:workout2/menu/profile.dart';
import 'package:workout2/screen/daily_screen.dart';

class DietPage extends StatefulWidget {
  const DietPage({Key? key}) : super(key: key);

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  int _selectedIndex = 0;

  Widget buildBottomNavigationBar(int selectedIndex, void Function(int) onItemTapped) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 145, 54, 175),
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 245, 243, 243),
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.local_dining_outlined, color: Color.fromARGB(255, 249, 248, 248)),
          label: 'Recipes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.offline_bolt_outlined, color: Color.fromARGB(255, 247, 246, 246)),
          label: 'Plan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Color.fromARGB(255, 247, 246, 246)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month, color: Color.fromARGB(255, 252, 251, 251)),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Color.fromARGB(255, 255, 254, 254)),
          label: 'Mine',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIET PLAN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        backgroundColor: const Color.fromARGB(255, 147, 76, 175),
        centerTitle: true,
      ),
      body: const SingleChildScrollView( 
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 7),
              child: Text(
                "To achieve better results, you need a better diet.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 1),
                  DietCard(
                    title: 'Breakfast',
                    image:
                        'assest/image/assets/break fast.jpeg', 
                    foods: [
                      'Whole-grain cereal',
                      'Greek yogurt',
                      'Fresh fruits',
                      'Nuts',
                    ],
                  ),
                  SizedBox(height: 18),
                  DietCard(
                    title: 'Lunch',
                    image: 'assest/image/assets/lunch.jpeg',
                    foods: [
                      'Grilled chicken',
                      'Brown rice',
                      'Steamed vegetables',
                    ],
                  ),
                  SizedBox(height: 18),
                  DietCard(
                    title: 'Snack',
                    image: 'assest/image/assets/snack.jpeg',
                    foods: [
                      'Almonds',
                      'Carrot sticks',
                      'Hummus',
                    ],
                  ),
                  SizedBox(height: 18),
                  DietCard(
                    title: 'Dinner',
                    image:
                        'assest/image/assets/dinner.jpeg', 
                    foods: [
                      'Salmon fillet',
                      'Quinoa',
                      'Green salad',
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(_selectedIndex, (index) {
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
          MaterialPageRoute(builder: (context) => const BodySelection()),
        );
        break;
            
          case 2:
             Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const DailyScreen(
                                 two: false,
                                three: false,
                                four: false,
                                five: false,
                                six: false,
                                one: true,
                                day1: false,
                                day2: false,
                                day3: false,
                                day4: false,
                                day5: false,
                                day6: false)
          ),
        );
            break;
          case 3:
            Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Calendar(date: false)),
        );
        break;
    
           
          case 4:
             Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MinePage(index: index),
          ),
        );
        break;
        }
      }),
    );
  }
}

class DietCard extends StatelessWidget {
  final String title;
  final String image;
  final List<String> foods;

  const DietCard({super.key, required this.title, required this.image, required this.foods});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var food in foods)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.circle, size: 8),
                            const SizedBox(width: 8),
                            Text(food),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

