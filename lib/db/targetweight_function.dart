

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:workout2/models/data_model.dart';

ValueNotifier<List<Targetweight>> weighttarget = ValueNotifier([]);


addfunction(Targetweight value) async {
  final db = await Hive.openBox<Targetweight>('weighttarget');
  await db.add(value);
  weighttarget.value.addAll(db.values);
  
  weighttarget.notifyListeners();
}

gettargetweight()async{
  final db = await Hive.openBox<Targetweight>('weighttarget');
  weighttarget.value.clear();
  weighttarget.value.addAll(db.values);
  weighttarget.notifyListeners();
}