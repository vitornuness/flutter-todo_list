import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_model/task_view_model.dart';
import 'package:todo_list/widget/info_snack_bar.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save(TaskViewModel viewModel) async {
    final title = _controller.text.trim();
    if (title.isNotEmpty) {
      await viewModel.create(title: title);
      _controller.clear();

      if (mounted) {
        InfoSnackBar.show(context, 'Tarefa adicionada com sucesso!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            child: Column(
              spacing: 24.0,
              children: [
                TextField(
                  controller: _controller,
                  autofocus: true,
                  decoration:
                      const InputDecoration(labelText: 'Adicione uma tarefa'),
                  onEditingComplete: () => _save(viewModel),
                  readOnly: viewModel.isLoading,
                ),
                ElevatedButton(
                  onPressed:
                      viewModel.isLoading ? null : () => _save(viewModel),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Salvar'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
