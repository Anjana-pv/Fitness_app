import 'package:flutter/material.dart';

import 'package:workout2/body_focus/body.dart';
import 'package:workout2/demo_model/model.dart';


enum SampleItem { itemOne, itemTwo }

class Bttbody extends StatefulWidget {
  const Bttbody({Key? key}) : super(key: key);

  @override
  State<Bttbody> createState() => _BttbodyState();
}

class _BttbodyState extends State<Bttbody> {
 
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
                    image: AssetImage('assest/image/assets/bodyparts/img.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 150,

            left: 20,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                 "",
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
                            '6 Mins, 6 Exercises',
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
                      MaterialPageRoute(builder: (ctx) => const BodySelection()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(161, 173, 196, 58),
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
    image: 'assest/image/assets/day1_images/squads.jpeg',
    title: 'SQUARDS',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/jumping squads.jpeg',
    title: 'BUTT BRIDGE',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/side lunges.jpeg',
    title: 'SIDE LUNGUES',
    subtitle: '20 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/day1_images/plank.png',
    title: 'PLAN',
    subtitle: '30 s',
  ),
  DayOneModel(
    image: 'assest/image/assets/abs/buttkick.gif',
    title: 'Butt KICKS',
    subtitle: '30 s',
  ),
];

