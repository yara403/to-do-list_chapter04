class ToDoItem {
  ToDoItem({
    required this.title,
    this.isDone = false,
  });

  final String title;
  final bool isDone;

  bool equals(Object o) {
    if (o.runtimeType != ToDoItem) return false;
    return ((o as ToDoItem).title == title && o.isDone == isDone);
  }
}
