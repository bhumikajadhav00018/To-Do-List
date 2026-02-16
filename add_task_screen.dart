

import 'package:finalproject/Models/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Task Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child:Text('Save Task'),
                onPressed: (){
                  if(controller.text.isNotEmpty) {
                    Navigator.pop(
                      context,
                      Task(title: controller.text),
                    );
                  }
                }
              )
            ],
          )
      )
    );
  }
}