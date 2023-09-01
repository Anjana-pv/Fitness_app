import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:workout2/db/db_signup_functions';
import 'package:workout2/menu/faqs.dart';
import 'package:workout2/menu/poli.dart';
import 'package:workout2/menu/profile.dart';
import 'package:workout2/menu/recipies.dart';

import '../body_focus/body.dart';
import '../screen/daily_screen.dart';
import '../screen/splash_screen.dart';
import 'celender.dart';

class MinePage extends StatefulWidget {
  final int index;
  const MinePage({Key? key, required this.index}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  TextEditingController userController = TextEditingController();

  int _selectedIndex = 4;

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    if (signUpListNotifier.value.isNotEmpty) {
      print("Username: ${signUpListNotifier.value.last.username}");
      userController.text = signUpListNotifier.value.last.username;
    }
  }

  Widget buildBottomNavigationBar(
      int selectedIndex, void Function(int) onItemTapped) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 145, 54, 175),
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 245, 243, 243),
      unselectedItemColor: const Color.fromARGB(255, 249, 248, 248), 
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_dining_outlined,
            color: Color.fromARGB(255, 249, 248, 248),
          ),
          label: 'Recipes',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.offline_bolt_outlined,
            color: Color.fromARGB(255, 247, 246, 246),
          ),
          label: 'Plan',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Color.fromARGB(255, 247, 246, 246),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_month,
            color: Color.fromARGB(255, 252, 251, 251),
          ),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Color.fromARGB(255, 255, 254, 254),
          ),
          label: 'Mine',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 167, 45, 204),
        
        title: const Text(
          'MINE',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              signUpListNotifier.value.isNotEmpty
                  ? "Hello, ${signUpListNotifier.value.last.username}"
                  : "Hello, Guest",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            color: const Color.fromARGB(255, 248, 250, 251),
            elevation: 4.0,
            margin: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('My Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.security),
                  title: const Text('Privacy and Policies'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen()),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.star_sharp),
                  title: const Text('Rate us'),
                  onTap: () {
                    showRatingDialog(context);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.question_answer),
                  title: const Text('FAQs'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FAQPage()),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    logout(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(_selectedIndex, (index) {
        setState(() {
          _selectedIndex = index;
        });

        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DietPage()),
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
              MaterialPageRoute(
                  builder: (context) => const DailyScreen(
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
                      day6: false)),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Calendar(date: false)),
            );
            break;

          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MinePage(
                  index: index,
                ),
              ),
            );
            break;
        }
      }),
    );
  }
}

void showRatingDialog(BuildContext context) {
  double userRating = 0;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Rate Us'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Please rate our app:'),
            const SizedBox(height: 16),
            RatingBar.builder(
              initialRating: userRating,
              minRating: 1,
              maxRating: 5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                userRating = rating;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Submit'),
          ),
        ],
      );
    },
  );
}

void logout(BuildContext context) {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure?'),
          actions: [
            TextButton(
              onPressed: () {
                signOut(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      });
}

Future<void> signOut(BuildContext context) async {
  final sharedPrefs = await SharedPreferences.getInstance();
  await sharedPrefs.clear();

  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (ctx) => const SplashScreen()),
    (route) => false,
  );
}
