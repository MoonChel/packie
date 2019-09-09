import 'package:flutter/material.dart';

import './models.dart';

class StoreProvider with ChangeNotifier {
  List<CheckList> myCheckLists;
  CheckList defaultCheckList;
  CheckList newCheckList;
  CheckList currentCheckList;

  StoreProvider({
    @required this.myCheckLists,
    @required this.defaultCheckList,
  });

  void setCurrentCheckList(CheckList checkList) {
    currentCheckList = checkList;

    notifyListeners();
  }

  void createNewCheckListCategory(String name) {
    newCheckList = CheckList(name: name, items: defaultCheckList.items);

    notifyListeners();
  }

  void updateCurrentCheckListName(String name) {
    var index = myCheckLists.indexOf(currentCheckList);
    currentCheckList = CheckList(name: name, items: currentCheckList.items);
    myCheckLists[index] = currentCheckList;

    notifyListeners();
  }

  void updateNewCheckListName(String name) {
    newCheckList = CheckList(name: name, items: newCheckList.items);

    notifyListeners();
  }

  void selectItemInCheckList(
    CheckList checkList,
    CheckListItem item,
    bool selected,
  ) {
    var index = checkList.items.indexOf(item);
    checkList.items[index] = CheckListItem(
      name: item.name,
      category: item.category,
      selected: selected,
    );

    notifyListeners();
  }

  void addNewCheckListCategoryToMyCategories() {
    var items = newCheckList.items.where((item) => item.selected);
    myCheckLists.add(CheckList(
      name: newCheckList.name,
      items: items,
    ));

    notifyListeners();
  }
}

class SettingsProvider with ChangeNotifier {
  SettingsProvider();
}
