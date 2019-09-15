import 'dart:ffi';

import 'package:flutter/material.dart';

import './models.dart';

class StoreProvider with ChangeNotifier {
  StoreProvider({
    @required this.myCheckLists,
    @required this.defaultCheckList,
  });

  List<CheckList> myCheckLists;
  CheckList defaultCheckList;
  CheckList _currentCheckList;

  CheckList get currentCheckList => _currentCheckList;

  set currentCheckList(CheckList currentCheckList) {
    _currentCheckList = currentCheckList;

    notifyListeners();
  }

  void createCheckList(String name) {
    final newCheckList = CheckList(
      name: name,
      categories: defaultCheckList.categories,
    );

    myCheckLists.add(newCheckList);

    currentCheckList = newCheckList;

    notifyListeners();
  }

  void updateCheckListName(String name) {
    var index = myCheckLists.indexOf(currentCheckList);
    currentCheckList = CheckList(
      name: name,
      categories: currentCheckList.categories,
    );
    myCheckLists[index] = currentCheckList;

    notifyListeners();
  }

  void selectItem({
    int index,
    bool selected,
    CheckListCategory category,
  }) {
    category.items[index] = CheckListItem(
      name: category.items[index].name,
      selected: selected,
    );

    notifyListeners();
  }

  void refreshCheckList() {
    currentCheckList.categories.forEach((category) {
      var index = currentCheckList.categories.indexOf(category);
      currentCheckList.categories[index] = CheckListCategory(
        name: category.name,
        iconPath: category.iconPath,
        items: category.items
            .map((item) => CheckListItem(name: item.name))
            .toList(),
      );
    });

    notifyListeners();
  }

  void removeItem(CheckListCategory category, int index) {
    category.items.removeAt(index);
    notifyListeners();
  }

  void addItem(CheckListCategory category, CheckListItem item) {
    category.items.insert(0, item);

    notifyListeners();
  }
}
