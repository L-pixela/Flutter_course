import 'package:flutter/material.dart';
import 'package:w3s2_flutter_class/W9-Practice/W9-S2-practice/1%20-%20Code%20Grocery%20-%20Start/models/grocery_item.dart';
import '../models/grocery_category.dart';

enum ItemMode { input, edit }

class NewItem extends StatefulWidget {
  final ItemMode mode;
  final GroceryItem? items;
  const NewItem({super.key, required this.mode, required this.items});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();

  late String? _enteredName;
  late int? _enterQuantity;
  GroceryCategory? _groceryCategory;
  bool reset = true;

  @override
  void initState() {
    if (widget.mode == ItemMode.edit) {
      _enteredName = widget.items!.name;
      _enterQuantity = widget.items!.quantity;
      _groceryCategory = widget.items!.category;
    } else {
      _enteredName = '';
      _enterQuantity = 1;
      _groceryCategory = null;
    }
    super.initState();
  }

  void _saveItem(BuildContext context) {
    // 1 - Validate the form
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      // 2 - Save the form to get last entered values
      _formKey.currentState!.save();

      final passedData = GroceryItem(
          id: 'z',
          name: _enteredName!,
          quantity: _enterQuantity!,
          category: _groceryCategory!);
      Navigator.pop(context, passedData);
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
  }

  String? validateQuantity(String? value) {
    if (value == null || value.isEmpty || int.tryParse(value) == null) {
      return 'Please enter a valid quantity.';
    }
    return null;
  }

  String? validateTitle(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _enteredName,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: validateTitle,
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _enterQuantity.toString(),
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      validator: validateQuantity,
                      onSaved: (value) {
                        _enterQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      value: _groceryCategory,
                      items: [
                        for (final category in GroceryCategory.values)
                          DropdownMenuItem<GroceryCategory>(
                            value: category,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.label),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          if (reset == true) {
                            value = _groceryCategory;
                          } else {
                            _groceryCategory = value;
                          }
                        });
                      },
                      onSaved: (newValue) {
                        _groceryCategory = newValue!;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _resetForm,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () => _saveItem(context),
                    child: widget.mode == ItemMode.input
                        ? Text("Add Item")
                        : Text("Update Item"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
