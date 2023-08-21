

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:workout2/models/data_model.dart';

ValueNotifier<List<GenterDetails>> genterListNotifier = ValueNotifier([]);


Future<void> addgenterDetail(GenterDetails value) async {
  final genterDB = await Hive.openBox<GenterDetails>('genter_db');
 await genterDB.add(value);
 genterListNotifier.value.addAll(genterDB.values);
  genterListNotifier.notifyListeners;

}

Future<void> updategenterDetail(GenterDetails value) async {
  final genterDB = await Hive.openBox<GenterDetails>('genter_db');
  genterDB.put(value.id, value);
  getallgenterDetails();
}


Future<void> getallgenterDetails() async {
   
  final genterDB = await Hive.openBox<GenterDetails>('genter_db');
 
  genterListNotifier.value.clear();
  genterListNotifier.value.addAll(genterDB.values);
 
  genterListNotifier.notifyListeners();
   
}
