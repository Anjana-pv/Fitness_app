import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/data_model.dart';

// ValueNotifier<List<WorkoutHistory>> workoutlistListner = ValueNotifier([]);

bool hasCompletedSixWorkouts() {
  final historyBox = Hive.box<WorkoutHistory>('workoutHistoryBox');
  final completedCount = historyBox.values.where((history) => history.isCompleted).length;
  return completedCount >= 6;
}
