import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/service/task_service.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskService _taskService;
  List<Task> _tasks = [];
  bool _isLoading = false;

  TaskViewModel({required TaskService taskService})
      : _taskService = taskService {
    _loadData();
  }

  bool get isLoading => _isLoading;
  List<Task> get tasks => _tasks;

  Future<void> _loadData() async {
    _isLoading = true;
    notifyListeners();
    _tasks = await _taskService.findAll();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> create({required String title}) async {
    await _taskService.create(title: title);
    await _loadData();
  }

  Future<void> toggleIsComplete({required int id}) async {
    await _taskService.toggleIsComplete(id: id);
    await _loadData();
  }

  Future<void> remove({required int id}) async {
    await _taskService.remove(id: id);
    await _loadData();
  }
}
