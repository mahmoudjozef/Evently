import 'package:evently_new/fireBase/FireBase_Functions.dart';
import 'package:evently_new/model/task_model.dart';
import 'package:flutter/foundation.dart';

class AddEventProv extends ChangeNotifier{
  int photosIndex=0;
DateTime Date=DateTime.now();
  ChangeDate(DateTime date){
    Date=date;
    notifyListeners();
  }
  ChangePhotos(int index){
    photosIndex=index;
    notifyListeners();
  }


  AddEvent(TaskModel task){
    FirebaseFunctions.craeteTask(task);
  notifyListeners();
  }


}