import 'package:flutter/material.dart';

import 'package:workout2/body_focus/body.dart';
import 'package:workout2/demo_model/model.dart';


enum SampleItem { itemOne, itemTwo }

class Armsbody extends StatefulWidget {
  const Armsbody ({Key? key}) : super(key: key);

  @override
  State<Armsbody> createState() => _ArmsbodyState();
}

class _ArmsbodyState extends State<Armsbody> {

  

  SampleItem? selectedMenu;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( 
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assest/image/assets/bodyparts/arms.jpeg'),
                    
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '6 Mins, 6 Exercises',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PopupMenuButton<SampleItem>(
                            initialValue: selectedMenu,
                            onSelected: (SampleItem item) {
                              setState(() {
                                selectedMenu = item;
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<SampleItem>>[
                              const PopupMenuItem<SampleItem>(
                                value: SampleItem.itemOne,
                                child: Text('Edit Plan'),
                              ),
                              const PopupMenuItem<SampleItem>(
                                value: SampleItem.itemTwo,
                                child: Text('Reset Plan'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: 500,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                dayOneList[index].title,
                                style:const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                dayOneList[index].subtitle,
                                style:const TextStyle(color: Colors.grey),
                              ),
                              leading: Image.asset(
                                dayOneList[index].image,
                                width: 100,
                                height: 90,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return  const Divider();
                          },
                          itemCount: dayOneList.length,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => BodySelection()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(240, 49, 187, 218),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    'START',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<DayOneModel> dayOneList = [
  DayOneModel(
    image: 'assest/image/assets/day1_images/alternate.gif',
    title: 'ALTERNATING HOOKS',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/Wall-Push-Up.gif',
    title: 'WALL PUSH-UPS',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/knee arm swing.jpeg',
    title: 'KNEE ARM SWING',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/wall push.gif',
    title: ' WALL PUSH',
    subtitle: '20 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/up and plank.jpeg',
    title: 'UP AND PLANK',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/Wall-Push-Up.gif',
    title: 'WALL PUSH-UP',
    subtitle: '30 s',
  ),
];

