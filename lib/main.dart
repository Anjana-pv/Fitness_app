import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:workout2/screen/splash_screen.dart';

import 'models/data_model.dart';





Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
   if (!Hive.isAdapterRegistered( SignUpModelAdapter().typeId)) {
      Hive.registerAdapter( SignUpModelAdapter());
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

