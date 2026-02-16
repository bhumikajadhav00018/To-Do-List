

import 'package:finalproject/Models/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onChanged;
  final VoidCallback onDelete;

  TaskTile({
    required this.task,
    required this.onChanged,
    required this.onDelete,
});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (_) => onChanged(),
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration:
            task.isCompleted ?
                TextDecoration.lineThrough: null,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }

}