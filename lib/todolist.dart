class TodoList {
  List<TodoTask> tasks;

  TodoList({required this.tasks});

  void addTask(TodoTask task) {
    tasks.add(task);
  }

  void deleteTask(TodoTask task) {
    tasks.removeAt(task.index);
  }

  void editTask(TodoTask task) {}
}

class TodoTask {
  int index;
  String taskName;
  String dueDate;
  String description;

  TodoTask({
    required this.index,
    required this.taskName,
    required this.dueDate,
    required this.description,
  });
}
