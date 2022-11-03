import 'package:flutter/material.dart';
import 'package:tasks_app/models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback bookmarkCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;

  const PopupMenu(
      {Key? key,
      required this.task,
      required this.cancelOrDeleteCallback,
      required this.bookmarkCallback,
        required this.editTaskCallback,
        required this.restoreTaskCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                    onTap: editTaskCallback,
                    child: TextButton.icon(
                        onPressed: editTaskCallback,
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit')),
                  ),
                  PopupMenuItem(
                    onTap: bookmarkCallback,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: task.isFavorite == false
                            ? const Icon(Icons.bookmark_add_outlined)
                            : const Icon(Icons.bookmark_remove),
                        label: task.isFavorite == false
                            ? const Text('Add to Bookmark')
                            : const Text('Remove from Bookmark')),
                  ),
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallback,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete')),
                  ),
                ])
            : (context) => [
                  PopupMenuItem(
                    onTap: restoreTaskCallback,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.restore_from_trash),
                        label: const Text('Restore')),
                  ),
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallback,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Delete Forever')),
                  ),
                ]);
  }
}
