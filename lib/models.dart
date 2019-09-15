import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class CheckList extends Equatable {
  int id;
  String name;
  List<CheckListCategory> categories;

  CheckList({this.id, this.name, this.categories}) : super([id, name]);

  factory CheckList.fromMap(Map<String, dynamic> map) {
    return CheckList(
      id: map["id"],
      name: map["name"],
      categories: (map["categories"] as List<Map<String, dynamic>>)
          .map((map) => CheckListCategory.fromMap(map))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "categories": categories.map((category) => category.toMap()).toList()
    };
  }

  int getRemainsCount() {
    final items =
        categories.map((c) => c.items).reduce((left, right) => left + right);
    return items.length - items.where((item) => item.selected).length;
  }

  List<CheckListItem> getAllItems() {
    return categories.map((c) => c.items).reduce((left, right) => left + right);
  }
}

class CheckListCategory extends Equatable {
  int id;
  final String name;
  final String iconPath;
  final List<CheckListItem> items;
  int checkListID;

  CheckListCategory({
    this.id,
    @required this.name,
    @required this.items,
    @required this.iconPath,
    this.checkListID,
  }) : super([id, iconPath]);

  factory CheckListCategory.fromMap(Map<String, dynamic> map) {
    return CheckListCategory(
      id: map["id"],
      name: map["name"],
      iconPath: map["icon_path"],
      items: (map["items"] as List<dynamic>)
          .map(
            (itemMap) => CheckListItem.fromMap(itemMap),
          )
          .toList(),
      checkListID: map['check_list_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "icon_path": iconPath,
      "items": items.map((item) => item.toMap()).toList(),
      "check_list_id": checkListID,
    };
  }
}

class CheckListItem extends Equatable {
  int id;
  String name;
  bool selected;
  int categoryId;

  CheckListItem({
    this.id,
    this.categoryId,
    this.selected = false,
    @required this.name,
  }) : super([id, name]);

  factory CheckListItem.fromMap(Map<String, dynamic> map) {
    return CheckListItem(
      id: map["id"],
      name: map["name"],
      selected: map["selected"] == 1,
      categoryId: map["category_id"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "selected": selected,
      "category_id": categoryId,
    };
  }
}

class PackingTip {
  const PackingTip({this.title, this.description});

  final String title;
  final String description;
}
