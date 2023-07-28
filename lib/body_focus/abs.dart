import 'package:flutter/material.dart';

import 'package:workout2/body_focus/body.dart';
import 'package:workout2/demo_model/model.dart';


enum SampleItem { itemOne, itemTwo }


class Absbody extends StatefulWidget {
  const Absbody({Key? key}) : super(key: key);

  @override
  State<Absbody> createState() => _AbsbodyState();
}

class _AbsbodyState extends State<Absbody> {
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
                    image: AssetImage('assest/image/assets/bodyparts/abbs.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 150,

            left: 170,








            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
               "   Sweat is just fat crying",
                style: TextStyle(
                  color: Color.fromARGB(255, 240, 238, 238),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                
                
                width: double.infinity,
                height: 600,

                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 245, 244, 244),
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
                    backgroundColor: Color.fromARGB(161, 52, 51, 52),
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
    image: 'assest/image/assets/abs/high stepping.gif',
    title: 'HIGH STEPPING',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/abs/maountain climber.gif',
    title: 'MOUNTAIN CLIMBER',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/abs/reverse crunches.gif',
    title: 'REVERSE CRUNCHES',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/plank.png',
    title: 'PLANK',
    subtitle: '20 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/abs/cobra.gif',
    title: 'COBRA STRACH',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/abs/Jumping-Jacks.gif',
    title: 'JUMPING JACKS',
    subtitle: '30 s',


  ),
];

