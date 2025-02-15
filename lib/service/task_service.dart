import 'package:todo_list/model/task.dart';
import 'package:todo_list/repository/task_repository.dart';

class TaskService {
  final TaskRepository _taskRepository;

  TaskService({required TaskRepository taskRepository})
      : _taskRepository = taskRepository;

  Future<List<Task>> findAll() async {
    return await _taskRepository.findAll();
  }

  Future<Task> create({required title, bool isComplete = false}) async {
    final task = Task(title: title);
    return await _taskRepository.create(task);
  }

  Future<Task> toggleIsComplete({required int id}) async {
    Task task = await _taskRepository.findById(id);
    task.isComplete = !task.isComplete;
    return await _taskRepository.update(id, task);
  }
}
