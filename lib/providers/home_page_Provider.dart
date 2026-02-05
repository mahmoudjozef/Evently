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

  Future<void> loadTasks() async {
    var snapshot = await FirebaseFunctions.getTask();
    tasks = snapshot.docs.map((e) => e.data()).toList();
    notifyListeners();
  }

  List<TaskModel> get filteredTasks {
    return tasks.where((task) {
      return task.category ==
          ['Birthday', 'Book Club', 'Exhibition', 'Sport', 'Meeting'][photosIndex];
    }).toList();
  }
}