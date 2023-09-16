// models/task_model.dart

class Task {
  final String title;
  final String image;
  final String description;
  bool isFavorite;

  Task({
    required this.title,
    required this.description,
    this.isFavorite = false,
    required this.image,
  });

  static fromMap(taskData) {}
}
