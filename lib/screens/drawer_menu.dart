import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc.dart';
import 'package:tasks_app/screens/recycle_bin.dart';
import 'package:tasks_app/screens/tabs_screen.dart';


class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(TabsScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My Tasks'),
                    trailing: Text('${state.pendingTasks.length} | ${state.completedTasks.length}'),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(RecycleBin.id),
              child:
              BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
                return ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                );
              }),
            ),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) => newValue
                      ? context.read<ThemeBloc>().add(ThemeLightEvent())
                      : context.read<ThemeBloc>().add(ThemeDarkEvent()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
