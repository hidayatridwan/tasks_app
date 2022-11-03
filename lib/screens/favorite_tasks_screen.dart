import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/widgets/tasks_list.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.favoriteTasks;
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
