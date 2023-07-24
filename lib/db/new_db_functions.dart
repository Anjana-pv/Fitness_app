import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:workout2/models/data_model.dart';



ValueNotifier<List< PersonalDetails>>personalListNotifier= ValueNotifier([]);

Future<void> addpersonalDetail(value) async {
  final personalDB = await Hive.openBox<PersonalDetails>('pesonal_db');
 personalDB.put(value.id, value);
  getallpersonalDatas();
}


Future<void> updatetohive(int id, PersonalDetails value) async {
  final personalDB = await Hive.openBox<PersonalDetails>('personal_db');
  personalDB.putAt(id, value);
  getallpersonalDatas();
}

Future<void> deletePersonalDetail(String id) async {
  final personalDB = await Hive.openBox<PersonalDetails>('personal_db');
  personalDB.delete(id);
  getallpersonalDatas();
}

Future<void> getallpersonalDatas() async {
  final personalDB = await Hive.openBox<PersonalDetails>('personal_db');
  personalListNotifier.value.clear();
  personalListNotifier.value.addAll(personalDB.values);
  personalListNotifier.notifyListeners();
  
}
Future<void> getalDatas() async {
  final personalDB = await Hive.openBox<PersonalDetails>('personal_db');
  personalListNotifier.value.clear();
  personalListNotifier.value.addAll(personalDB.values);
  personalListNotifier.notifyListeners();
  
}

