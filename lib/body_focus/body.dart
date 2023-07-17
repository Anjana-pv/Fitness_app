import 'package:flutter/material.dart';

import 'package:workout2/body_focus/abs.dart';




class BodySelection extends StatefulWidget {
  const BodySelection({Key? key}) : super(key: key);

  @override
  State<BodySelection> createState() => _BodySelectionState();
}

class _BodySelectionState extends State<BodySelection> {
  List<String> imagePaths = [
    'assest/image/assets/bodyparts/download (1).jpeg',
    'assest/image/assets/bodyparts/arms.jpeg',
    'assest/image/assets/bodyparts/leg.jpeg',
    'assest/image/assets/bodyparts/img.jpeg',
    'assest/image/assets/bodyparts/abbs.jpeg'
  ];
  List<String> imageDescriptions = [
    'Workout for FullBody',
    'Workout for Arms',
    'Workout for Leg',
    'Workout for Butt',
    'Workout for Abs',
  ];
  int selectedIndex = 0;

  Widget buildCard(int index) {
    final isSelected = index == selectedIndex;
    final cardColor =
        isSelected ? Color.fromARGB(255, 135, 228, 169) : Colors.white;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Card(
        color: cardColor,
        child: Container(
          child: Column(
            children: [
              Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              ),
              SizedBox(height: 15),
              Text(
                imageDescriptions[index],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "What's Your Focus Part",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Focus on your target area and 25% of your time",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) => buildCard(index),
            ),
          ),
         SizedBox(
          height: 40,

         ),
          const Padding(
            padding: EdgeInsets.only(left:10),
            child: Row(
              
              children: [
                Text('2 min workout',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              ],
            ),
          ),


          const SizedBox(height: 15),

          Card(
            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset(
                  'assest/image/assets/bodyparts/face.jpeg',
                  fit: BoxFit.cover,
                ),
                
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' Slim down your face',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Text(
                  '',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 90,




          ),
          ElevatedButton(
            onPressed: () {
               Navigator.of(context).push(
               MaterialPageRoute(builder: (ctx) =>DetailPage
               
               () ),
               );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(131, 172, 89, 218),
              minimumSize: const Size(150, 50),
            ),
            child: const Text(
              '    Select    ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
