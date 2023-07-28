import 'package:flutter/material.dart';
import 'package:workout2/body_focus/abs.dart';
import 'package:workout2/body_focus/arms.dart';
import 'package:workout2/body_focus/btt.dart';
import 'package:workout2/body_focus/face.dart';
import 'package:workout2/body_focus/fullbody.dart';
import 'package:workout2/body_focus/leg.dart';



class BodySelection extends StatefulWidget {
  const BodySelection({
    Key? key,
  }) : super(key: key);

  @override
  State<BodySelection> createState() => _BodySelectionState();
}

String? selectvalue;
String ? focusvalue;

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
    'Workout for Leg',
    'Workout for Arms',
    'Workout for Butt',
    'Workout for Abs',
  ];
 
  int selectedIndex = 0;
  int selectedImageIndex = -1;

  Widget buildCard(int index) {
    final isCardSelected = index == selectedImageIndex;
   
    final cardColor = isCardSelected ? Colors.green : Color.fromARGB(255, 217, 214, 214);
  
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImageIndex = index;
        });
      },
      child: Card(
        color: cardColor,
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
    );
  }

  void navigateToSelectedPage() {
    if (selectedImageIndex >= 0 &&
        selectedImageIndex < imageDescriptions.length) {
      String selectedRouteName = imageDescriptions[selectedImageIndex];
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (ctx) => getPageForRouteName(selectedRouteName)),
      );
    }
  }

  Widget getPageForRouteName(String routeName) {
    switch (routeName) {
      case 'Workout for FullBody':
        return const WorkoutScreen();
         case 'Workout for Leg':
        return const leginbody();
      case 'Workout for Arms':
        return const Armsbody();
      case 'Workout for Butt':
        return const Bttbody();
      case 'Workout for Abs':
        return const Absbody();

      default:
        return Armsbody();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "What's Your Focus Part",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Focus on your target area and 25% of your time",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {},
              child: Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) => buildCard(index),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    '2 min workout',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => facebody()),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                      'assets/image/assets/bodyparts/face.jpeg',
                      fit: BoxFit.cover,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Slim down your face \n\n Click here',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {

                navigateToSelectedPage();
                
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
      ),
    );
  }
}
