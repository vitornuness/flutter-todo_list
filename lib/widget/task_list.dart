import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_model/task_view_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          // Verifica se está carregando
          return const Center(
              child: CircularProgressIndicator()); // Exibe o loading
        } else if (viewModel.tasks.isEmpty) {
          // Verifica se a lista está vazia após o carregamento
          return const Center(
              child: Text(
                  "Nenhuma tarefa encontrada.")); // Mensagem de lista vazia
        } else {
          return ListView.builder(
            itemCount: viewModel.tasks.length,
            itemBuilder: (context, index) {
              final task = viewModel.tasks[index];
              return Card(
                  child: Padding(
                padding: EdgeInsets.all(12.0),
                child: ListTile(
                  title: Text(task.title),
                  trailing: Checkbox(
                    value: task.isComplete,
                    onChanged: (value) async {
                      await viewModel.toggleIsComplete(id: task.id);
                    },
                  ),
                ),
              ));
            },
          );
        }
      },
    );
  }
}
