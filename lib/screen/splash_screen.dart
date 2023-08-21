import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:workout2/db/new_db_functions.dart';
import 'package:workout2/main.dart';
import 'package:workout2/screen/daily_screen.dart';
import 'package:workout2/screen/login.dart';


class SplashScreen extends StatefulWidget{
 const SplashScreen ({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
   void initState() {
    gotologin();
    super.initState();
    getalDatas();


  }

  @override
  void didChangeDependencies() {
    
    super.didChangeDependencies();
  }

  @override
 Widget build(BuildContext context) {
  bool isLoading = true;
  return Scaffold(
    body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assest/image/assets/img1.jpg'),
              
              fit: BoxFit.cover,
            ),
          ),
        ),
         if (isLoading)
          Container(
            color: const Color.fromARGB(26, 84, 84, 79).withOpacity(0.5),
            child: Center(
              child: SizedBox(
                height: 4,
                width: MediaQuery.of(context).size.width * 0.5,
                child: LinearProgressIndicator(
                  backgroundColor: const Color.fromARGB(255, 116, 249, 116).withOpacity(0.5),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 234, 237, 233)),
                ),
              ),
            ),
          ),

        Positioned(
         top: MediaQuery.of(context).size.height * 0.5 - 50, 
         left: 2,
         right: 0,
          child:const Center(
            
            child: Text(
              'LOST WEIGHT',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        
        
        Positioned(
         top: MediaQuery.of(context).size.height * 0.6 - 70, 
         left: 2,
         right: 0,
          child: const Center(
            
            child: Text(
              'IN 30 DAYS',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotologin() async {
     await Future.delayed(const Duration(seconds: 4));
   
    
     final sharenew=await SharedPreferences.getInstance();
     final usersignup=sharenew.getBool(savekey);
    if(usersignup == null||usersignup == false){
       Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => const Screenlogin()),
     );
    }else{
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) =>const  DailyScreen(two: false, three: false, four: false, five: false, six: false,one: true, day1: false,day2: false,day3: false,day4: false,day5: false,day6: false,)),);

    }
   }
}


