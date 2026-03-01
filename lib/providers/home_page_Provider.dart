import 'package:evently_new/fireBase/FireBase_Functions.dart';
import 'package:evently_new/model/task_model.dart';
import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier{
  int photosIndex=0;
  List<TaskModel> tasks = [];

  ChangeCategory(int index) {
    photosIndex = index;
    notifyListeners();
  }


}