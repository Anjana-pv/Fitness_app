import 'package:flutter/material.dart';
import 'package:workout2/body_focus/fullbody.dart';
import 'package:workout2/db/db_storeworkout.dart';

import 'package:workout2/menu/celender.dart';
import 'package:workout2/menu/mine.dart';


import 'package:workout2/menu/recipies.dart';


import 'package:workout2/sub_wokoutscreen.dart/week3.dart';

import '../screen/daily_screen.dart';


class Week2 extends StatefulWidget {
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
  const Week2(
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
  State<Week2> createState() => Week2State();
}

class Week2State extends State<Week2> {
  int _selectedIndex = 0;
   int? check;


 @override
  void initState(){
    getworkoutlist();
    super.initState();
  

  }




  void onItemTapped(int index) {
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
          MaterialPageRoute(builder: (context) => const Calendar(date: false)),
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
  }
    
  

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  const Color.fromARGB(255, 145, 54, 175),
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
                color:  widget.one
                    ? const Color.fromARGB(255, 153, 90, 234)
                    : const Color.fromARGB(255, 250, 252, 253),
                child: ListTile(
                  title:  Text(
                    ' Day 1',
                    style: TextStyle(
                      color: widget.one 
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle:  Text(
                    ' 6 Exercises', 
                    style: TextStyle(
                      color: widget.one 
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: widget.one ? ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const WorkoutScreen(click: 1)));
                    },
                    child: const Text('Start'),
                  ) : widget.day1 ? const Icon(Icons.task_alt_outlined,color: Colors.green,) : const Icon(Icons.lock_outline) 
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
                    title:  Text(
                      ' Day 2',
                      style: TextStyle(
                        color: widget.two 
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle:  Text(
                      ' 6 Exercises', // Customize the subtitle
                       style: TextStyle(
                      color: widget.two
                    ?  const Color.fromARGB(255, 255, 255, 255)
                    :  const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: widget.two
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const WorkoutScreen(click: 2)));
                            },
                            child: const Text('Start'),
                          )
                        :widget.day2 ? const Icon(Icons.task_alt_outlined,color: Colors.green,) : const Icon(Icons.lock_outline) 
                ),
              ),
               const SizedBox(
                height: 7,
              ),
              Card(
                color: widget.three
                    ? const Color.fromARGB(255, 153, 90, 234)
                    : const Color.fromARGB(255, 250, 252, 253),
                child: ListTile(
                    title:  Text(
                      ' Day 3',
                      style: TextStyle(
                        color:  widget.three
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle:  Text(
                      ' 6 Exercises',
                      style: TextStyle(
                        color:widget.three
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: widget.three
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const WorkoutScreen(click: 3)));
                            },
                            child: const Text('Start'),
                          )
                        :widget.day3? const Icon(Icons.task_alt_outlined,color: Colors.green,) : const Icon(Icons.lock_outline))),
              const SizedBox(
                height: 10,
              ),
              Card(
                color:  widget.four
                    ? const Color.fromARGB(255, 153, 90, 234)
                    : const Color.fromARGB(255, 250, 252, 253),
                child: ListTile(
                    title:  Text(
                      ' Day 4',
                      style: TextStyle(
                        color: widget.four
                   ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle:  Text(
                      ' 6 Exercises', 
                      style: TextStyle(
                        color: widget.four
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: widget.four
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const WorkoutScreen(click: 4)));
                            },
                            child: const Text('Start'),
                          )
                        : widget.day4? const Icon(Icons.task_alt_outlined,color: Colors.green,) : const Icon(Icons.lock_outline) ),
              ),
              const SizedBox(
                height: 7,
              ),
              Card(
                color:  widget.five
                    ? const Color.fromARGB(255, 153, 90, 234)
                    : const Color.fromARGB(255, 250, 252, 253),
                child: ListTile(
                    title:  Text(
                      ' Day 5',
                      style: TextStyle(
                        color: widget.five 
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle:  Text(
                      ' 6 Exercises', // Customize the subtitle
                      style: TextStyle(
                       color: widget.five
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: widget.five
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const WorkoutScreen(click: 5)));
                            },
                            child: const Text('Start'),
                          )
                        : widget.day5?const Icon(Icons.task_alt_outlined,color: Colors.green,) : const Icon(Icons.lock_outline) 
              ),
              ),
              const SizedBox(height: 7),
              Card(
                color:  widget.six
                    ? const Color.fromARGB(255, 153, 90, 234)
                    : const Color.fromARGB(255, 250, 252, 253),
                child: ListTile(
                    title:  Text(
                      ' Day 6',
                      style: TextStyle(
                        color:widget.six
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle:  Text(
                      ' 6 Exercises', // Customize the subtitle
                      style: TextStyle(
                        color:widget.six
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: widget.six
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const WorkoutScreen(click: 6)));
                            },
                            child: const Text('Start'),
                          )
                        : widget.day6? const Icon(Icons.task_alt_outlined,color: Colors.green,) : const Icon(Icons.lock_outline)),
              ),
              const SizedBox(
                height: 7,
              ),
               GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const Week3(two: false, three: false, four: false, five: false, six: false, one: true,day1: false,day2: false,day3: false,day4: false,day5: false,day6: false,)
                                   
                  
                      ));
                },
                 child: const Card(
                  color: Color.fromARGB(255, 247, 249, 251),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'NEXT WEEK 3',
                        style: TextStyle(
                          color: Color.fromARGB(223, 126, 23, 216),
                          fontSize: 25,
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
          backgroundColor:  const Color.fromARGB(255, 145, 54, 175),
          type: BottomNavigationBarType.fixed, 
          
          currentIndex: _selectedIndex,
          selectedItemColor:  const Color.fromARGB(255, 245, 243, 243),
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
                color: Color.fromARGB(255, 252, 251, 251),
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
        ),
      ),
        );
      
    
  }

  }

          