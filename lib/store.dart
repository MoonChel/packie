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

  void createCheckList(String name, List<CheckListCategory> categories) {
    final newCheckList = CheckList(
      name: name,
      items: defaultCheckList.items.where(
        (item) => categories.contains(item.category),
      ),
    );

    myCheckLists.add(newCheckList);

    currentCheckList = newCheckList;

    notifyListeners();
  }

  void updateCheckListName(String name) {
    var index = myCheckLists.indexOf(currentCheckList);
    currentCheckList = CheckList(name: name, items: currentCheckList.items);
    myCheckLists[index] = currentCheckList;

    notifyListeners();
  }

  void selectItem(CheckListItem item, bool selected) {
    var index = currentCheckList.items.indexOf(item);
    currentCheckList.items[index] = CheckListItem(
      name: item.name,
      category: item.category,
      selected: selected,
    );

    notifyListeners();
  }
}
