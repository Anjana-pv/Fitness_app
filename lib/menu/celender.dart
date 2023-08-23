import "package:flutter/material.dart";
import 'package:table_calendar/table_calendar.dart';
import 'package:workout2/body_focus/body.dart';
import 'package:workout2/menu/mine.dart';
import 'package:workout2/menu/recipies.dart';
import 'package:workout2/screen/daily_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calendar extends StatefulWidget {
  final bool date;
   const Calendar({super.key, required this.date});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
   DateTime? signInDate; 

  @override
  void initState() {
    super.initState();
    loadSignInDate();
  }
void loadSignInDate() async {
    signInDate = await getSignInDate();
    setState(() {});
  }
 int _selectedIndex = 3;

  Widget buildBottomNavigationBar(int selectedIndex, void Function(int) onItemTapped) {
    return BottomNavigationBar(
      backgroundColor:   const Color.fromARGB(255, 145, 54, 175),
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 245, 243, 243),
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
        backgroundColor: const Color.fromARGB(255, 145, 54, 175),
        title: const Text(
          'CALENDAR',
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(rangeStartDay: DateTime.now(),   
              firstDay: DateTime.utc(2023, 1, 1), 
            lastDay: DateTime.utc(2023, 12, 31), 
            focusedDay: DateTime.now(),
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              )
            ),
              selectedDayPredicate: (day) {
              return signInDate != null &&
                  isSameDay(signInDate!, day); 
            },
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
            builder: (context) =>MinePage(index: index,),
          ),
        );
        break;

        }
      }),
    );
  }
}
Future<void> storeSignInDate(DateTime date) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('sign_in_date', date.toIso8601String());
  print(date.toIso8601String());
}

Future<DateTime?> getSignInDate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? dateString = prefs.getString('sign_in_date');
  if (dateString != null) {
    return DateTime.parse(dateString);
  }
  return null;
}