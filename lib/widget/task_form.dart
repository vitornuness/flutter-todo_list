import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_model/task_view_model.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  TaskFormState createState() => TaskFormState();
}

class TaskFormState extends State<TaskForm> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            ),
            Row(
              children: [
                Expanded(
                  child: Consumer<TaskViewModel>(
                    builder: (context, viewModel, child) {
                      if (viewModel.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ElevatedButton(
                          onPressed: () async {
                            final title = _controller.text.trim();
                            if (title.isNotEmpty) {
                              await viewModel.create(title: title);
                              _controller.clear();
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text('Salvar'),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
