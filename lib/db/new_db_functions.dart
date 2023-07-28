import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:workout2/models/data_model.dart';



ValueNotifier<List< PersonalDetails>>personalListNotifier= ValueNotifier([]);

Future<void> addpersonalDetail(PersonalDetails value) async {
  final personalDB = await Hive.openBox<PersonalDetails>('personal_db');
 await personalDB.add(value);
 personalListNotifier.value.addAll(personalDB.values);

  personalListNotifier.notifyListeners();
}


Future<void> updatetohive(PersonalDetails value) async {
  final personalDB = await Hive.openBox<PersonalDetails>('personal_db');
  log(personalDB.length.toString());
  personalDB.putAt(0, value);
  await getalDatas();
  personalListNotifier.notifyListeners();
}

Future<void> deletePersonalDetail(String id) async {
  final personalDB = await Hive.openBox<PersonalDetails>('personal_db');
  personalDB.delete(id);
  getalDatas();
}

Future<void> getallpersonalDatas() async {
  final personalDB = await Hive.openBox<PersonalDetails>('personal_db');
  personalListNotifier.value.clear();
  personalListNotifier.value.addAll(personalDB.values);
  personalListNotifier.notifyListeners();
  
}
Future<void> getalDatas() async {
  log('reached here');
  final personalDB = await Hive.openBox<PersonalDetails>('personal_db');
  personalListNotifier.value.clear();
  personalListNotifier.value.addAll(personalDB.values);
  log(personalListNotifier.value.length.toString());
  personalListNotifier.notifyListeners();
  
  
}
Future<List<PersonalDetails>> getallNewpersonalDatas() async {
  getalDatas();
  final personalDB = await Hive.openBox<PersonalDetails>('personal_db');
  return personalDB.values.toList();
}


