import 'package:flutter/material.dart';
import 'package:workout2/body_focus/workout.dart';
import 'package:appbar_animated/appbar_animated.dart';
//import 'package:workout/BodyFocus/workout.dart';



// class Absscreen extends StatefulWidget {
//   const Absscreen({Key? key}) : super(key: key);

//   @override
//   State<Absscreen> createState() => _AbsscreenState();
// }

// class _AbsscreenState extends State<Absscreen> {
  
 

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: DetailPage(),
//     );
//   }
// }

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
  // SampleItem? selectedMenu;

  // int _selectedIndex = 0;

  // void onitemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldLayoutBuilder(
        backgroundColorAppBar:
            const ColorBuilder(Colors.transparent, Color.fromARGB(255, 193, 114, 224)),
        textColorAppBar: const ColorBuilder(Color.fromARGB(255, 12, 12, 12)),
        appBarBuilder: _appBar,
         child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                "assets/maxresdefault.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.36,
                ),
               // height: 900,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                  color: Colors.white,

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final weekList = week[index];
                        if (index == 0) {
                          // Display start button for Week 1
                          return Card(
                            color: Color.fromARGB(238, 119, 68, 240),
                            child: ListTile(
                              title: Text(weekList),
                              subtitle: Text(' 6 Exercises'),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (ctx) => WorkoutScreen()),
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
                              subtitle: Text('6 Exercises'),
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
            ],
                ),
         
            

          ),
        ),
      );
    
  }

  Widget _appBar(BuildContext context, ColorAnimated colorAnimated) {
    return AppBar(
      backgroundColor: colorAnimated.background,
      elevation: 0,
      title: Text(
        "AppBar Animate",
        style: TextStyle(
          color: colorAnimated.color,
        ),
      ),
      leading: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: colorAnimated.color,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: colorAnimated.color,
          ),
        ),
      ],
    );
  }
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
