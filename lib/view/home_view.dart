import 'package:flutter/material.dart';
import 'package:todo_list/widget/task_form.dart';
import 'package:todo_list/widget/task_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Tarefas',
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, height: 2.0),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const TaskForm(),
                  const Expanded(child: TaskList()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
