import 'package:mobx/mobx.dart';

import 'shared/models/todo_item.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<ToDoItem> toDoItemList = ObservableList<ToDoItem>.of([]);
  @observable
  ObservableList<ToDoItem> doneItemList = ObservableList<ToDoItem>.of([]);
  @observable
  int _selectedIndex = 0;

  @computed
  int get length => toDoItemList.length;

  int get selectedIndex => _selectedIndex;

  @action
  changePage(int index) {
    _selectedIndex = index;
  }

  @action
  void onAddItem(String itemTitle) {
    toDoItemList.add(
      ToDoItem(
        title: itemTitle,
      ),
    );
  }

  @action
  void onResetItem(ToDoItem item) {
    doneItemList.remove(item);

    toDoItemList.add(
      ToDoItem(
        title: item.title,
      ),
    );
  }

  @action
  void onRemoveToDoItem(ToDoItem item) {
    toDoItemList.remove(item);
  }

  @action
  void onRemoveDoneItem(ToDoItem item) {
    doneItemList.remove(item);
  }

  @action
  void onCompleteItem(ToDoItem item) {
    toDoItemList.remove(item);

    doneItemList.add(
      ToDoItem(
        title: item.title,
        isDone: true,
      ),
    );
  }
}
