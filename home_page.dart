import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'home_controller.dart';

import 'screens/done_screen.dart';
import 'screens/task_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;
  late PageController _pageViewController;

  @override
  void initState() {
    controller = HomeController();
    _pageViewController = PageController(
      initialPage: controller.selectedIndex,
      keepPage: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        children: <Widget>[
          TaskScreen(
            itemList: controller.toDoItemList,
            onAddItem: controller.onAddItem,
            onCompleteItem: controller.onCompleteItem,
            onRemoveItem: controller.onRemoveToDoItem,
          ),
          DoneScreen(
            itemList: controller.doneItemList,
            onRemoveItem: controller.onRemoveDoneItem,
            onResetItem: controller.onResetItem,
          ),
        ],
        onPageChanged: (index) {
          controller.changePage(index);
        },
      ),
      bottomNavigationBar: Observer(builder: (context) {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (index) {
            controller.changePage(index);
            _pageViewController.animateToPage(
              controller.selectedIndex,
              duration: Duration(milliseconds: 350),
              curve: Curves.easeOut,
            );
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box_outline_blank),
              label: 'Pendentes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box),
              label: 'Concluídas',
            ),
          ],
        );
      }),
    );
  }
}
