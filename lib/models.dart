import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

class CheckList extends Equatable {
  final String name;
  final List<CheckListItem> items;

  CheckList({
    @required this.name,
    @required this.items,
  }) : super([name]);

  Map<CheckListCategory, List<CheckListItem>> groupByCategory() {
    return groupBy(this.items, (CheckListItem item) => item.category);
  }
}

class CheckListCategory {
  final String name;
  final String iconPath;

  CheckListCategory({
    @required this.name,
    @required this.iconPath,
  });
}

class CheckListItem extends Equatable {
  final String name;
  final bool selected;
  final CheckListCategory category;

  CheckListItem({
    @required this.name,
    this.selected = false,
    @required this.category,
  }) : super([name, category.name]);
}

class PackingTip {
  const PackingTip({this.title, this.description});

  final String title;
  final String description;
}
