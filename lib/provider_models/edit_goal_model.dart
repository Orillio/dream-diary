import 'package:dream_diary/utilities/mock_storage.dart';
import 'package:flutter/material.dart';

import '../models/dream.dart';
import '../models/goal.dart';
import '../models/task.dart';

class EditGoalModel extends ChangeNotifier {

  late Goal goal;


  EditGoalModel.fromDream(Dream dream) {
    goal = Goal(title: dream.title, caption: dream.caption, imageUrl: dream.imageUrl, fromNetwork: dream.fromNetwork)
    ..rawImage = dream.rawImage;
  }
  EditGoalModel.fromGoal(Goal newGoal) {
    goal = newGoal;
  }

  void addNewTask(Task task) {
    goal.tasks ??= <Task>[];
    goal.tasks!.add(task);
    notifyListeners();
  }

}