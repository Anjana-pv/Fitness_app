
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:workout2/models/data_model.dart';

ValueNotifier<List<WorkoutHistory>>workoutlist = ValueNotifier([]);

Future<void>openworkout(WorkoutHistory value)async{

  List<WorkoutHistory> open = [
    WorkoutHistory(two: false),
    WorkoutHistory(three: false),
    WorkoutHistory(four: false),
    WorkoutHistory(five: false),
    WorkoutHistory(six: false),
    
  ];
  final workoutDb =await Hive.openBox<WorkoutHistory>('wrkout_db');
  await workoutDb.addAll(open);
  
}

Future<void> getworkoutlist() async {
  final workoutDb = await Hive.openBox<WorkoutHistory>('wrkout_db'); 
 workoutlist.value.clear();
  workoutlist.value.addAll(workoutDb.values);
 workoutlist.notifyListeners();
}
bool? openfield(){
  bool returnvalue = false;

  for (var x in workoutlist.value) {
    returnvalue = x.two;
    returnvalue = x.three;
    returnvalue = x.four;
    returnvalue = x.five;
    returnvalue = x.six;


  }
  return returnvalue;
}

