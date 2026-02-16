import 'dart:convert';
import 'package:finalproject/Models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TaskStorage {
  static const String key = 'tasks';

  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> taskList =
      tasks.map((task) => jsonEncode(task.toMap())).toList();
    prefs.setStringList(key, taskList);
  }

  static Future<List<Task>> loadTasks() async{
    final prefs = await SharedPreferences.getInstance();
    List<String>? taskList = prefs.getStringList(key);

    if(taskList == null) return[];

    return taskList
        .map((task)=> Task.fromMap(jsonDecode(task)))
        .toList();
  }
}