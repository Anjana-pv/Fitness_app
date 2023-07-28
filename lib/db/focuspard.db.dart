

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:workout2/models/data_model.dart';


ValueNotifier<List<FocusArea>> focusAreaListner = ValueNotifier([]);

Future<void> addFocusPart(FocusArea value) async {
  final focusAreaDb = await Hive.openBox<FocusArea>('focus_db');
  await focusAreaDb.add(value);
  focusAreaListner.value.addAll(focusAreaDb.values);
  
  focusAreaListner.notifyListeners();
}

Future<void> getFocusAreas() async {
  final focusAreaDb = await Hive.openBox<FocusArea>('focus_db');
  focusAreaListner.value.clear();
  focusAreaListner.value.addAll(focusAreaDb.values);
  focusAreaListner.notifyListeners();
}