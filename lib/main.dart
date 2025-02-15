import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/repository/task_repository.dart';
import 'package:todo_list/service/task_service.dart';
import 'package:todo_list/view/home_view.dart';
import 'package:todo_list/view_model/task_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => TaskRepository()),
      Provider(
          create: (context) => TaskService(taskRepository: TaskRepository())),
      ChangeNotifierProvider(
          create: (context) => TaskViewModel(
              taskService: Provider.of<TaskService>(context, listen: false))),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Lista de Tarefas', home: HomeView());
  }
}
