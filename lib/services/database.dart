import 'package:flutter/foundation.dart';

import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:packie/models.dart';

class DB {
  sql.Database db;

  final String dbName;

  DB({@required this.dbName});

  Future initDB() async {
    final databasesPath = await sql.getDatabasesPath();
    final path = p.join(databasesPath, dbName);
    db = await sql.openDatabase(
      path,
      version: 1,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
    );
    // db.execute("DELETE FROM check_list;");
    // db.execute("DELETE FROM check_list_category;");
    // db.execute("DELETE FROM check_list_item;");
  }

  Future<List<CheckList>> loadCheckLists() async {
    // table name : columns list
    const tables = {
      "check_list": ["id", "name"],
      "check_list_category": ["id", "name", "icon_path", "check_list_id"],
      "check_list_item": ["id", "name", "selected", "category_id"]
    };

    var results = [];

    for (MapEntry<String, List<String>> entry in tables.entries) {
      var result = await db.query(
        entry.key,
        columns: entry.value,
        orderBy: ["check_list", "check_list_item"].contains(entry.key)
            ? "id desc"
            : null,
      );
      results.add(result);
    }

    List<CheckList> myCheckLists = [];

    for (Map<String, dynamic> checkList in results[0]) {
      List<Map<String, dynamic>> categories = [];

      for (Map<String, dynamic> category in results[1]) {
        Map<String, dynamic> categoryMap = {
          'id': category['id'],
          'name': category['name'],
          'icon_path': category['icon_path'],
          'check_list_id': category['check_list_id'],
          'items': []
        };

        if (checkList['id'] == category['check_list_id']) {
          categories.add(categoryMap);
        } else {
          continue;
        }

        for (Map<String, dynamic> item in results[2]) {
          if (category['id'] == item['category_id']) {
            categoryMap['items'].add(item);
          }
        }
      }

      myCheckLists.add(
        CheckList.fromMap({
          'id': checkList['id'],
          'name': checkList['name'],
          'categories': categories,
        }),
      );
    }

    return myCheckLists;
  }

  Future createCheckList(CheckList checkList) async {
    var checkListMap = checkList.toMap();
    List<Map<String, dynamic>> categories = checkListMap.remove('categories');

    await db.transaction((txn) async {
      checkListMap.remove('id');
      var checkListId = await txn.insert("check_list", checkListMap);

      // update objects in provider
      checkList.id = checkListId;

      var i = 0;
      for (var categoryMap in categories) {
        List<Map<String, dynamic>> items = categoryMap.remove('items');

        // default categories are always saved
        categoryMap.remove('id');
        categoryMap['check_list_id'] = checkListId;
        var categoryId = await txn.insert("check_list_category", categoryMap);

        var category = checkList.categories[i];
        category.id = categoryId;

        var j = 0;
        for (var itemMap in items) {
          itemMap.remove('id');
          itemMap['category_id'] = categoryId;
          var itemId = await txn.insert("check_list_item", itemMap);

          category.items[j].id = itemId;
          category.items[j].categoryId = categoryId;
          j++;
        }

        i++;
      }
    });
  }

  Future removeCheckList(CheckList checkList) async {
    for (var category in checkList.categories) {
      await db.delete(
        "check_list_category",
        whereArgs: [category.id],
        where: "id = ?",
      );
    }
    await db.delete("check_list", whereArgs: [checkList.id], where: "id = ?");
  }

  Future updateCheckListName(String newName, int id) {
    return db.update(
      "check_list",
      {'name': newName},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future updateCheckListItemName(String newName, int id) {
    return db.update(
      "check_list_item",
      {'name': newName},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future selectItem(CheckListItem item, bool selected) {
    return db.update(
      "check_list_item",
      {"selected": selected},
      where: "id = ?",
      whereArgs: [item.id],
    );
  }

  Future refreshCheckList(List<CheckListItem> items) async {
    items.forEach((item) async {
      await selectItem(item, false);
    });
  }

  Future<int> removeItem(CheckListItem item) async {
    return await db.delete(
      "check_list_item",
      whereArgs: [item.id],
      where: "id = ?",
    );
  }

  Future<int> addItem(CheckListItem item) async {
    return await db.insert("check_list_item", item.toMap());
  }

  _onCreate(sql.Database db, int version) async {
    const createTablesSql = [
      "CREATE TABLE IF NOT EXISTS check_list (id INTEGER PRIMARY KEY, name VARCHAR);",
      "CREATE TABLE IF NOT EXISTS check_list_category (id INTEGER PRIMARY KEY, name VARCHAR, icon_path VARCHAR, check_list_id INTEGER);",
      "CREATE TABLE IF NOT EXISTS check_list_item (id INTEGER PRIMARY KEY, name VARCHAR, selected BOOLEAN, category_id INTEGER);",
    ];

    for (var sql in createTablesSql) {
      await db.execute(sql);
    }
  }

  _onConfigure(sql.Database db) async {
    // Add support for cascade delete
    await db.execute("PRAGMA foreign_keys = ON");
  }

  void close() async {
    return db.close();
  }
}
