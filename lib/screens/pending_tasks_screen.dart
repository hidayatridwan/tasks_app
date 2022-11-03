import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/widgets/tasks_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Column(children: [
          Center(
            child: Chip(label: Text('${tasksList.length} Pending | ${state.completedTasks.length} Completed')),
          ),
          TasksList(tasksList: tasksList)
        ]);
      },
    );
  }
}
