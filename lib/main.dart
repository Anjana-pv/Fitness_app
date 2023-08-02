import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:workout2/screen/splash_screen.dart';

import 'models/data_model.dart';

const savekey = ' userlogin';



Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
   if (!Hive.isAdapterRegistered( SignUpModelAdapter().typeId)) {
      Hive.registerAdapter( SignUpModelAdapter());
   }
   if (!Hive.isAdapterRegistered( PersonalDetailsAdapter().typeId)) {
      Hive.registerAdapter( PersonalDetailsAdapter());
      
   }
   if (!Hive.isAdapterRegistered(GenterDetailsAdapter().typeId)) {
      Hive.registerAdapter( GenterDetailsAdapter());
   }
   
   if (!Hive.isAdapterRegistered(TargetweightAdapter().typeId)) {
      Hive.registerAdapter( TargetweightAdapter());
   }
    if (!Hive.isAdapterRegistered(FocusAreaAdapter().typeId)) {
      Hive.registerAdapter( FocusAreaAdapter());
   }
   if (!Hive.isAdapterRegistered(WorkoutHistoryAdapter().typeId)) {
      Hive.registerAdapter( WorkoutHistoryAdapter());
   }
  
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 17, 102, 37)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

