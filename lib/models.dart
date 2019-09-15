import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';
import 'package:packie/components/_all.dart';

class CheckList extends Equatable {
  final String name;
  final List<CheckListCategory> categories;

  CheckList({
    @required this.name,
    @required this.categories,
  }) : super([name]);

  int getRemainsCount() {
    final items =
        categories.map((c) => c.items).reduce((left, right) => left + right);
    return items.length - items.where((item) => item.selected).length;
  }
}

class CheckListCategory extends Equatable {
  final String name;
  final String iconPath;
  final List<CheckListItem> items;

  CheckListCategory({
    @required this.name,
    @required this.items,
    @required this.iconPath,
  }) : super([name, iconPath]);
}

class CheckListItem extends Equatable {
  final String name;
  final bool selected;

  CheckListItem({
    @required this.name,
    this.selected = false,
  }) : super([name]);
}

class PackingTip {
  const PackingTip({this.title, this.description});

  final String title;
  final String description;
}
