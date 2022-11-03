import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/services/uuid.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
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
                    var task = Task(
                        id: UUIDGen.generate(),
                        title: titleController.text,
                        description: descriptionController.text,
                        date: DateTime.now().toString());
                    context.read<TasksBloc>().add(AddTask(task: task));
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
