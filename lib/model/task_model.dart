import 'package:flutter/material.dart';
import 'package:todo_project/model/colors.dart';

class TaskModel {
  Color? userSelectColor;
  final int taskId;
  final String taskName;
  final String description;
  bool flag;
  String date = DateTime.now().toString();

  TaskModel(
      {required this.taskId,
      this.flag = false,
      required this.userSelectColor,
      required this.taskName,
      required this.description,
      required this.date});
}

class ListTask with ChangeNotifier {
  List<TaskModel> taskList = [];

  void addTodoItem({required TaskModel task}) {
    taskList.add(task);

    // every time when we call this method, notifylisteners will listen the changes
    notifyListeners();
  }

  void removeTask({required int id}) {
    taskList.removeWhere((element) => element.taskId == id);
    notifyListeners();
  }

  void complete() {
    for (var i = 0; i < taskList.length; i++) {
      taskList[i].userSelectColor == green
          ? taskList[i].flag = true
          : taskList[i].flag = false;
    }
    notifyListeners();
  }

  void getID() {
    for (var i = 0; i < taskList.length; i++) {
      print(taskList[i].taskId);
    }
  }
}
