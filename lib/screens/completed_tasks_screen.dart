import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/widgets/tasks_list.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;
        return Column(children: [
          Center(
            child: Chip(label: Text('${tasksList.length} Tasks')),
          ),
          TasksList(tasksList: tasksList)
        ]);
      },
    );
  }
}
