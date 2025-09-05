class Task {

  static int _idCounter = 0;

  final int id;
  final String title;
  bool isDone;

  Task({
    required this.title,
    this.isDone = false
  }): id = ++_idCounter;

  Task copyWith({String? title, bool? isDone}) => Task(
    title: title ?? this.title,
    isDone: isDone ?? this.isDone
    );
}