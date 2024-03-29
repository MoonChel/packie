import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:packie/models.dart';
import 'package:packie/tab_provider.dart';
import 'package:provider/provider.dart';

import 'package:packie/components/_all.dart';
import 'package:packie/constants.dart';
import 'package:packie/store.dart';

class ChecklistDetailsPage extends StatefulWidget {
  static const routeName = '/ChecklistDetailsPage';

  @override
  _ChecklistDetailsPageState createState() => _ChecklistDetailsPageState();
}

class _ChecklistDetailsPageState extends State<ChecklistDetailsPage>
    with SingleTickerProviderStateMixin {
  final su = ScreenUtil.getInstance();

  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final store = Provider.of<StoreProvider>(context);
    final checkList = store.currentCheckList;

    final textController = TextEditingController(text: checkList.name);

    return ChangeNotifierProvider<TabProvider>(
      builder: (_) => TabProvider(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(su.setHeight(280)),
          child: buildAppBar(),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: su.setWidth(Constants.bodyPadding),
            right: su.setWidth(Constants.bodyPadding),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  showUpdateCheckListModal(
                    context,
                    textTheme,
                    textController,
                    store,
                  );
                },
                onDoubleTap: () {
                  showUpdateCheckListModal(
                    context,
                    textTheme,
                    textController,
                    store,
                  );
                },
                child: Text(checkList.name, style: textTheme.headline),
              ),
              Text(
                "Remains: ${checkList.getRemainsCount()}",
                style: textTheme.subhead,
              ),
              Expanded(
                child: buildCheckListTabs(checkList),
              ),
              SizedBox(height: su.setHeight(60)),
              MyRaisedButton(
                color: Constants.orange,
                text: "Refresh",
                onPressed: () async {
                  await store.refreshCheckList();
                },
              ),
              SizedBox(height: su.setHeight(80)),
            ],
          ),
        ),
      ),
    );
  }

  Future showUpdateCheckListModal(BuildContext context, TextTheme textTheme,
      TextEditingController textController, StoreProvider store) {
    return showMyBottomSheetModal(
      context: context,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Update Checklist", style: textTheme.headline),
        ),
        SizedBox(height: su.setHeight(50)),
        Flexible(
          child: TextField(
            controller: textController,
            maxLines: 1,
            maxLength: 50,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "List Name",
            ),
          ),
        ),
        SizedBox(height: su.setHeight(30)),
        MyRaisedButton(
          text: "Update",
          onPressed: () {
            if (textController.text.isEmpty) {
              return;
            }
            store.updateCheckListName(textController.text);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  Widget buildCheckListTabs(CheckList checkList) {
    return Consumer<TabProvider>(
      builder: (context, tabProvider, child) {
        return Column(
          children: <Widget>[
            CategoriesView(categories: checkList.categories),
            Expanded(
              child: ListView.builder(
                itemCount: checkList.categories[tabProvider.index].items.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildCheckListItem(index, tabProvider);
                },
              ),
            )
          ],
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MyBackButton(),
            Consumer<TabProvider>(
              builder: (context, tabProvider, child) {
                return CornerButton(
                  onPressed: () {
                    showCreateItemModal(context, tabProvider);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCheckListItem(
    int itemIndex,
    TabProvider tabProvider,
  ) {
    final store = Provider.of<StoreProvider>(context);

    final item =
        store.currentCheckList.categories[tabProvider.index].items[itemIndex];
    final textController = TextEditingController(text: item.name);
    final textTheme = Theme.of(context).textTheme;

    return Dismissible(
      key: Key(item.name),
      onDismissed: (direction) {
        store.removeItem(
          store.currentCheckList.categories[tabProvider.index],
          itemIndex,
        );
      },
      child: GestureDetector(
        onDoubleTap: () {
          showMyBottomSheetModal(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Update Item", style: textTheme.headline),
            ),
            SizedBox(height: su.setHeight(50)),
            Flexible(
              child: TextField(
                controller: textController,
                maxLines: 1,
                maxLength: 50,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Item's Name",
                ),
              ),
            ),
            SizedBox(height: su.setHeight(30)),
            MyRaisedButton(
              text: "Update",
              onPressed: () {
                if (textController.text.isEmpty) {
                  return;
                }
                store.updateItemName(item, textController.text);
                Navigator.of(context).pop();
              },
            )
          ], context: context);
        },
        onTap: () async {
          await store.selectItem(item, !item.selected);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 15,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Checkbox(
                  value: item.selected,
                  onChanged: (bool value) async {
                    await store.selectItem(item, value);
                  },
                ),
                SizedBox(width: 10),
                Expanded(child: Text(item.name)),
              ],
            ),
            decoration: BoxDecoration(
              color: Constants.backgroundColor,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesView extends StatelessWidget {
  CategoriesView({
    Key key,
    this.categories,
  }) : super(key: key);

  final ScreenUtil su = ScreenUtil.getInstance();
  final List<CheckListCategory> categories;

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);

    return GridView.count(
      padding: EdgeInsets.only(
        top: su.setHeight(50),
        bottom: su.setHeight(30),
      ),
      crossAxisCount: 4,
      crossAxisSpacing: 15,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: categories
          .asMap()
          .map(
            (index, category) => MapEntry(
              index,
              CategoryIcon(
                iconImage: category.iconPath,
                selected: tabProvider.index == index,
                onPressed: () {
                  tabProvider.index = index;
                },
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}

Future showCreateItemModal(BuildContext context, TabProvider tabProvider) {
  final textTheme = Theme.of(context).textTheme;
  final su = ScreenUtil.getInstance();
  final textController = TextEditingController();
  final store = Provider.of<StoreProvider>(context);

  return showMyBottomSheetModal(
    context: context,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text("Add New Item", style: textTheme.headline),
      ),
      SizedBox(height: su.setHeight(50)),
      Flexible(
        child: TextField(
          controller: textController,
          maxLines: 1,
          maxLength: 50,
          autofocus: true,
          decoration: InputDecoration(
            hintText: "List Name",
          ),
        ),
      ),
      SizedBox(height: su.setHeight(30)),
      MyRaisedButton(
        text: "Add Item",
        onPressed: () {
          if (textController.text.isEmpty) {
            return;
          }
          store.addItem(
            store.currentCheckList.categories[tabProvider.index],
            CheckListItem(name: textController.text),
          );
          Navigator.of(context).pop();
        },
      )
    ],
  );
}
