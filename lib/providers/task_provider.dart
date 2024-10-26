import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);
  
  List<Task> get completedTasks => 
      _tasks.where((task) => task.isCompleted).toList();
  
  List<Task> get pendingTasks => 
      _tasks.where((task) => !task.isCompleted).toList();

  void addTask({required String title, required String description}) {
    final task = Task(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
      isCompleted: false,
    );
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskStatus(String id) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex] = _tasks[taskIndex].copyWith(
        isCompleted: !_tasks[taskIndex].isCompleted,
      );
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void updateTask(Task task) {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      notifyListeners();
    }
  }
}