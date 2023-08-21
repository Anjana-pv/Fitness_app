


import 'package:hive/hive.dart';
import 'package:workout2/models/data_model.dart';


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