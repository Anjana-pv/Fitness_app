
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:workout2/models/data_model.dart';

ValueNotifier<List<WorkoutHistory>>Workoutlist = ValueNotifier([]);

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
 Workoutlist.value.clear();
  Workoutlist.value.addAll(workoutDb.values);
 Workoutlist.notifyListeners();
}
bool? openfield(){
  bool returnvalue = false;

  for (var x in Workoutlist.value) {
    returnvalue = x.two;
    returnvalue = x.three;
    returnvalue = x.four;
    returnvalue = x.five;
    returnvalue = x.six;


  }
  return returnvalue;
}

