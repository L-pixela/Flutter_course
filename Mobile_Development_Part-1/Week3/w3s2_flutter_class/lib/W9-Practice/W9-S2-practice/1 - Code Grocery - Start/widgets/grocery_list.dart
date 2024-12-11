import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/dummy_items.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';

enum Mode { normal, selection }

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  Mode _mode = Mode.normal;
  final List<GroceryItem> selectedItem = [];

  void _newItem({GroceryItem? items, int? index}) async {
    final passedData = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewItem(
                  mode: items == null ? ItemMode.input : ItemMode.edit,
                  items: items,
                )));

    if (passedData != null) {
      setState(() {
        if (index == null) {
          dummyGroceryItems.add(passedData);
        } else {
          dummyGroceryItems[index] = passedData;
        }
      });
    }
  }

  void _toggleSelectionMode() {
    setState(() {
      _mode = _mode == Mode.normal ? Mode.selection : Mode.normal;
      if (_mode == Mode.normal) {
        selectedItem.clear();
      }
    });
  }

  void _removeSelectedItem() {
    setState(() {
      dummyGroceryItems.removeWhere((item) => selectedItem.contains(item));
      _toggleSelectionMode();
    });
  }

  void _toggleSelection(GroceryItem items) {
    setState(() {
      if (selectedItem.contains(items)) {
        selectedItem.remove(items);
      } else {
        selectedItem.add(items);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final item = dummyGroceryItems.removeAt(oldIndex);
            dummyGroceryItems.insert(newIndex, item);
          });
        },
        children: [
          for (int i = 0; i < dummyGroceryItems.length; i++)
            CategoryListTile(
              items: dummyGroceryItems[i],
              index: i,
              isSelected: selectedItem.contains(dummyGroceryItems[i]),
              mode: _mode,
              onLongPressed: _toggleSelectionMode,
              onTap: () {
                if (_mode == Mode.selection) {
                  _toggleSelection(dummyGroceryItems[i]);
                } else {
                  _newItem(items: dummyGroceryItems[i], index: i);
                }
              },
              key: ValueKey(dummyGroceryItems[i]),
            )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_mode == Mode.normal
            ? 'Your Groceries'
            : '${selectedItem.length} Items Selected'),
        actions: [
          if (_mode == Mode.selection)
            IconButton(
                onPressed: _removeSelectedItem, icon: Icon(Icons.remove)),
          if (_mode == Mode.normal)
            IconButton(
              onPressed: _newItem,
              icon: const Icon(Icons.add),
            ),
        ],
        leading: _mode == Mode.selection
            ? IconButton(
                onPressed: _toggleSelectionMode, icon: Icon(Icons.arrow_back))
            : null,
      ),
      body: content,
    );
  }
}

class CategoryListTile extends StatelessWidget {
  final GroceryItem items;
  final int index;
  final bool isSelected;
  final Mode mode;
  final VoidCallback onTap;
  final VoidCallback onLongPressed;
  const CategoryListTile(
      {super.key,
      required this.items,
      required this.index,
      required this.isSelected,
      required this.mode,
      required this.onTap,
      required this.onLongPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        key: ValueKey(key),
        leading: mode == Mode.selection
            ? Checkbox(
                value: isSelected,
                onChanged: (bool? value) {
                  onTap();
                })
            : Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: items.category.color,
                    borderRadius: BorderRadius.circular(8)),
              ),
        title: Text(items.name),
        trailing: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text("${items.quantity}"),
        ),
        onTap: onTap,
        onLongPress: onLongPressed,
      ),
    );
  }
}
