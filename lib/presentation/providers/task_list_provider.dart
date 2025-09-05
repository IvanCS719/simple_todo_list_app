import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo_list_app/domain/entities/task.dart';

class TaskListNotifier extends StateNotifier<List<Task>>{
  TaskListNotifier() : super([]);

  void addTask(String title){
    state = [...state, Task(title: title)];
  }

  void removeTask(int id) {
    state = state.where((task) => task.id != id).toList();
  }

  void toggleTask(int id){
    state = [
      for (final task in state)

        task.id == id
        ? task.copyWith(isDone: !task.isDone)
        : task
           
      
    ];
  }
  
}

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>(
  (ref) => TaskListNotifier()
  );