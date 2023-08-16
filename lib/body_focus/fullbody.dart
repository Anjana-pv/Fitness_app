

import 'package:flutter/material.dart';

import 'package:workout2/demo_model/model.dart';

import 'package:workout2/sub_wokoutscreen.dart/sub_squard.dart';

enum SampleItem { itemOne, itemTwo }

class WorkoutScreen extends StatefulWidget {
   final int? click;
   const WorkoutScreen({Key? key,required  this.click, }) : super(key: key);

  @override
  WorkoutScreenState createState() => WorkoutScreenState();
}

class WorkoutScreenState extends State<WorkoutScreen> {
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
                           'assest/image/assets/day1_images/how-to-do-squats.gif',
                  'assest/image/assets/day1_images/Wall-Push-Up.gif',
                  'assest/image/assets/day1_images/butt_bridge.gif',
                  'assest/image/assets/day1_images/plank.png',
                  'assest/image/assets/day1_images/stand bicycle crunch.gif',
                  'assest/image/assets/day1_images/fire-hydrant-exercise-illustration (1) right.gif'
                          ],
                          name: const [
                           " SQUARTS",
                            'WALL PUSH UP',
                            'BUTT BRIDGE',
                            'PLANK',
                            'STAND BICYCLE CRUNCH',
                            'FIRE HYDRATE',
                            
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
    image: 'assest/image/assets/day1_images/how-to-do-squats.gif',
    title: 'SQUATS',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/Wall-Push-Up.gif',
    title: 'WALL PUSH-UPS',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/butt_bridge.gif',
    title: 'BUTT BRIDGE',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/plank.png',
    title: 'PLANK',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/stand bicycle crunch.gif',
    title: 'STANDING BICYCLE CRUNCHES',
    subtitle: '30 s',
  ),
  DayOneModel(
    image:
        'assest/image/assets/day1_images/fire-hydrant-exercise-illustration (1) right.gif',
    title: 'FIRE HYDRANT',
    subtitle: '30 s',
  ),
];
