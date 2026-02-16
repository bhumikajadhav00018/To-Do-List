import 'package:flutter/material.dart';
import 'package:finalproject/Models/task_model.dart';
import 'package:finalproject/Utils/task_storage.dart';
import '../Widgets/task_tile.dart';
import '../Screens/add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  List<Task> tasks = [];

  @override
  void initState(){
    super.initState();
    loadTasks();
  }

  void loadTasks() async{
    tasks = await TaskStorage.loadTasks();
    setState(() {});
  }

  void updateTasks(){
    TaskStorage.saveTasks(tasks);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Final Tasks')),
      body: tasks.isEmpty
          ? Center(child: Text('No Task Added'))
          : ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context,index){
          return TaskTile(
            task: tasks[index],
            onChanged: (){
              tasks[index].isCompleted =
              !tasks[index].isCompleted;
              updateTasks();
            },
            onDelete: (){
              tasks.removeAt(index);
              updateTasks();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newTask = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddTaskScreen())
          );
          if(newTask != null){
            tasks.add(newTask);
            updateTasks();
          }
        },
      ),
    );
  }
}