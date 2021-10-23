import 'gerencia_de_estado.dart';
import 'shared/models/todo_item.dart';

class HomeController extends GerenciaDeEstado<List<ToDoItem>> {
  late List<ToDoItem> _toDoItemList;

  HomeController() : super(initialState: []) {
    _toDoItemList = <ToDoItem>[];
  }

  int get length => _toDoItemList.length;

  List<ToDoItem> get toDoItemList =>
      _toDoItemList.where((item) => !item.isDone).toList();

  List<ToDoItem> get doneItemList =>
      _toDoItemList.where((item) => item.isDone).toList();

  void onAddItem(String itemTitle) {
    _toDoItemList.add(
      ToDoItem(
        title: itemTitle,
      ),
    );
    super.setState(_toDoItemList);
  }

  void onCompleteItem(ToDoItem item) {
    _toDoItemList[_toDoItemList.indexOf(item)] =
        ToDoItem(title: item.title, isDone: true);
    super.setState(_toDoItemList);
  }

  void onRemoveToDoItem(ToDoItem item) {
    _toDoItemList.remove(item);
    super.setState(_toDoItemList);
  }

  void onResetItem(ToDoItem item) {
    _toDoItemList[_toDoItemList.indexOf(item)] = ToDoItem(title: item.title);
    super.setState(_toDoItemList);
  }

  void onRemoveDoneItem(ToDoItem item) {
    _toDoItemList.remove(item);
    super.setState(_toDoItemList);
  }
}
