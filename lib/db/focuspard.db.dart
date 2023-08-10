

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:workout2/models/data_model.dart';


// ValueNotifier<List<FocusArea>> focusAreaListner = ValueNotifier([]);

// Future<void> addFocusPart(FocusArea value) async {
//   final focusAreaDb = await Hive.openBox<FocusArea>('focus_db');
//   await focusAreaDb.add(value);
//   focusAreaListner.value.addAll(focusAreaDb.values);
  
//   focusAreaListner.notifyListeners();
// }

// Future<void> getFocusAreas() async {
//   final focusAreaDb = await Hive.openBox<FocusArea>('focus_db');
//   focusAreaListner.value.clear();
//   focusAreaListner.value.addAll(focusAreaDb.values);
//   focusAreaListner.notifyListeners();
// }


const focusdbname = "focusdb";
abstract class FocusDBfuctionds {
  Future <List<FocusArea>> getallfocusdatas();
  Future<void>addfocusdata(FocusArea value);

}
 class FocusDB implements FocusDBfuctionds{
  @override
  Future <void> addfocusdata(FocusArea value) async {
    final focusdb =await Hive.openBox<FocusArea>(focusdbname);
    await focusdb.add(value);

  }
 
  @override
  Future<List<FocusArea>> getallfocusdatas() async{
 final focusdb =await Hive.openBox<FocusArea>(focusdbname); 
 return focusdb.values.toList() ;
  }
 }