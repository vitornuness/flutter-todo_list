import 'package:todo_list/model/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  TaskRepository() {
    _tasks.add(Task(title: 'Tarefa 1', id: 1));
    _tasks.add(Task(title: 'Tarefa 2', id: 2));
    _tasks.add(Task(title: 'Tarefa 3', id: 3));
    _tasks.add(Task(title: 'Tarefa 4', id: 4));
    _tasks.add(Task(title: 'Tarefa 5', id: 5));
    _tasks.add(Task(title: 'Tarefa 6', id: 6));
    _tasks.add(Task(title: 'Tarefa 7', id: 7));
    _tasks.add(Task(title: 'Tarefa 8', id: 8));
    _tasks.add(Task(title: 'Tarefa 9', id: 9));
    _tasks.add(Task(title: 'Tarefa 10', id: 10));
  }

  Future<List<Task>> findAll() async {
    await Future.delayed(Duration(seconds: 1));
    final tasks = List<Task>.from(_tasks);
    tasks.sort((a, b) => a.isComplete && !b.isComplete ? 1 : -1);
    return tasks;
  }

  Future<Task> findById(int id) async {
    return _tasks.singleWhere((task) => task.id == id);
  }

  Future<Task> create(Task task) async {
    task.id = _getNextId();
    _tasks.add(task);
    return task;
  }

  Future<Task> update(int id, Task task) async {
    Task taskRecovered = await findById(id);
    taskRecovered = task;
    return taskRecovered;
  }

  int _getNextId() {
    return _tasks.isNotEmpty ? _tasks.last.id + 1 : 1;
  }
}
