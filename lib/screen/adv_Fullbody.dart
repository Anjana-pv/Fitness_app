
import 'package:flutter/material.dart';

import 'package:workout2/demo_model/model.dart';

import 'package:workout2/sub_wokoutscreen.dart/sub_squard.dart';

enum SampleItem { itemOne, itemTwo }

class AdvScreen extends StatefulWidget {
   final int? click;
   const AdvScreen({Key? key,required  this.click, }) : super(key: key);

  @override
 AdvScreenState createState() => AdvScreenState();
}

class AdvScreenState extends State<AdvScreen> {
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
                    image: AssetImage('assest/image/assets/biggner.jpg'),
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
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '4 Mins, 6 Exercises',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 500,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                dayOneList[index].title,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                dayOneList[index].subtitle,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              leading: Image.asset(
                                dayOneList[index].image,
                                width: 100,
                                height: 90,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
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
                      MaterialPageRoute(
                        builder: (ctx) =>  TimerScreen(
                          imagePaths: const [
                          'assest/image/assets/day1_images/mountain.gif',
                          'assest/image/assets/day1_images/butt-kicks.gif',
                          'assest/image/assets/day1_images/bureep.gif',
                          'assest/image/assets/day1_images/Jumping-Jack.gif',
                          'assest/image/assets/day1_images/butt-kicks.gif',
                          'assest/image/assets/day1_images/jumping squards.gif',

                          ],
                          name: const [
                          'MOUNTAIN CLIMBER',
                          'JUMPING SQUADS',
                          'BURPEES',
                          'JUMPING JACKS',
                          'BUTT KICKS',
                          'JUMPING SQUADS',

                            
                          ],
                        click: widget.click!,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(162, 217, 98, 236),
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
    image: 'assest/image/assets/day1_images/mountain.gif',
    title: 'MOUNTAIN CLIMBER',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/butt-kicks.gif',
    title: 'JUMPING SQUADS',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/bureep.gif',
    title: 'BURPEES',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/Jumping-Jack.gif',
    title: 'JUMPING JACKS',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/butt-kicks.gif',
    title: 'BUTT KICKS',
    subtitle: '30 s',
  ),
  DayOneModel(
    image:
        'assest/image/assets/day1_images/jumping squards.gif',
    title: 'JUMPING SQUADS',
    subtitle: '30 s',
  ),
];
