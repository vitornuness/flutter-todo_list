import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_model/task_view_model.dart';
import 'package:todo_list/widget/info_snack_bar.dart';
import 'package:todo_list/widget/task_list_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.tasks.isEmpty) {
          return const Center(child: Text('Nenhuma tarefa encontrada.'));
        } else {
          return ListView.builder(
            itemCount: viewModel.tasks.length,
            itemBuilder: (context, index) {
              final task = viewModel.tasks[index];
              return Column(
                children: [
                  TaskListItem(
                    task: task,
                    onRemove: () => InfoSnackBar.show(
                        context, 'Tarefa removida com sucesso!'),
                  ),
                  Divider(),
                ],
              );
            },
          );
        }
      },
    );
  }
}
