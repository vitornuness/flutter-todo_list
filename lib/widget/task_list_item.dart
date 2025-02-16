import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/view_model/task_view_model.dart';

class TaskListItem extends StatefulWidget {
  final Task task;
  final Function() onRemove;

  const TaskListItem({super.key, required this.task, required this.onRemove});

  @override
  createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  Future<void> _remove(int id, TaskViewModel viewModel) async {
    widget.onRemove();
    await viewModel.remove(id: id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(builder: (context, viewModel, child) {
      return Dismissible(
          key: Key(widget.task.id.toString()),
          background: Container(
            color: Colors.red[200],
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) => _remove(widget.task.id, viewModel),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: ListTile(
              title: MouseRegion(
                  cursor: SystemMouseCursors.resizeLeftRight,
                  child: Text(widget.task.title)),
              trailing: Checkbox(
                value: widget.task.isComplete,
                onChanged: (value) async =>
                    await viewModel.toggleIsComplete(id: widget.task.id),
              ),
            ),
          ));
    });
  }
}
