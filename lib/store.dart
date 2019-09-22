import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:packie/models.dart';
import 'package:packie/services/database.dart';
import 'package:packie/dummy_data.dart';

class StoreProvider with ChangeNotifier {
  DB db = GetIt.I.get<DB>();

  List<CheckList> myCheckLists = [];

  final CheckList defaultCheckList = CheckList(
    name: "Default checklist",
    categories: [
      clothesCategory,
      toiletriesCategory,
      miscCategory,
      carryOnCategory,
    ],
  );

  CheckList _currentCheckList;
  CheckList get currentCheckList => _currentCheckList;
  set currentCheckList(CheckList currentCheckList) {
    _currentCheckList = currentCheckList;
    notifyListeners();
  }

  Future loadMyCheckLists() async {
    myCheckLists = await db.loadCheckLists();
  }

  Future removeCheckList(CheckList checkList) async {
    await db.removeCheckList(checkList);
    myCheckLists.remove(checkList);
    notifyListeners();
  }

  Future updateItemName(CheckListItem item, String name) async {
    item.name = name;
    await db.updateCheckListItemName(name, item.id);
    notifyListeners();
  }

  Future updateCheckListName(String name) async {
    await db.updateCheckListName(name, currentCheckList.id);
    currentCheckList.name = name;
    notifyListeners();
  }

  Future createCheckList(String name) async {
    final checkList = CheckList(
      name: name,
      categories: defaultCheckList.categories
          .map(
            (c) => CheckListCategory(
              iconPath: c.iconPath,
              name: c.name,
              items: c.items
                  .map(
                    (item) => CheckListItem(name: item.name),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );

    await db.createCheckList(checkList);

    currentCheckList = checkList;

    myCheckLists.add(currentCheckList);

    notifyListeners();
  }

  Future selectItem(CheckListItem item, bool selected) async {
    var category =
        currentCheckList.categories.firstWhere((c) => c.id == item.categoryId);
    var index = category.items.indexWhere((cItem) => cItem.id == item.id);

    category.items[index].selected = selected;

    await db.selectItem(item, selected);

    notifyListeners();
  }

  Future refreshCheckList() async {
    var items = currentCheckList.getAllItems();

    items.forEach((item) {
      item.selected = false;
    });

    await db.refreshCheckList(items);

    notifyListeners();
  }

  Future removeItem(CheckListCategory category, int index) async {
    await db.removeItem(category.items[index]);
    category.items.removeAt(index);
    notifyListeners();
  }

  Future addItem(CheckListCategory category, CheckListItem item) async {
    item.categoryId = category.id;
    item.id = await db.addItem(item);
    category.items.insert(0, item);
    notifyListeners();
  }
}
