import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc.dart';
import 'package:tasks_app/screens/drawer_menu.dart';
import 'package:tasks_app/widgets/tasks_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: TextButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.delete_forever),
                              label: const Text('Delete All Task')),
                          onTap: () =>
                              context.read<TasksBloc>().add(DeleteAllTask()),
                        )
                      ])
            ],
          ),
          drawer: const DrawerMenu(),
          body: Column(
            children: [
              Center(
                child: Chip(label: Text('${state.removedTasks.length} Tasks')),
              ),
              TasksList(tasksList: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}
