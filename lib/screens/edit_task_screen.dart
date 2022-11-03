import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc.dart';
import 'package:tasks_app/models/task.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;

  const EditTaskScreen({Key? key, required this.oldTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldTask.description);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
                labelText: 'Title', border: OutlineInputBorder()),
            autofocus: true,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
                labelText: 'Description', border: OutlineInputBorder()),
            minLines: 3,
            maxLines: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    var editedTask = Task(
                        id: oldTask.id,
                        title: titleController.text,
                        description: descriptionController.text,
                        date: DateTime.now().toString(),
                        isFavorite: oldTask.isFavorite,
                        isDone: false);
                    context
                        .read<TasksBloc>()
                        .add(EditTask(oldTask: oldTask, newTask: editedTask));
                    Navigator.pop(context);
                  },
                  child: const Text('Save'))
            ],
          ),
        ],
      ),
    );
  }
}
