import 'package:firstapp/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var shoppingListState = Provider.of<ShoppingListState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ShoppingList(),
    );
  }
}

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  TextEditingController itemController = TextEditingController();
  int editingIndex = -1;

  void addItemToList() {
    String newItem = itemController.text;
    if (newItem.isNotEmpty) {
      Provider.of<ShoppingListState>(context, listen: false).addItem(newItem);
      itemController.clear();
    }
  }

  void removeItem(int index) {
    Provider.of<ShoppingListState>(context, listen: false).removeItem(index);
  }

  void startEditing(int index) {
    setState(() {
      // Access the item list using your ShoppingListState
      var shoppingListState =
          Provider.of<ShoppingListState>(context, listen: false);
      editingIndex = index;
      itemController.text = shoppingListState.items[index];
    });
  }

  void saveEdit(int index) {
    setState(() {
      // Access the item list using your ShoppingListState
      var items = Provider.of<ShoppingListState>(context).items;

      items[index] = itemController.text;
      itemController.clear();
      editingIndex = -1;
    });
  }

  void cancelEdit() {
    setState(() {
      itemController.clear();
      editingIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access the item list using your ShoppingListState
    var items = Provider.of<ShoppingListState>(context).items;

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: itemController,
                  decoration: InputDecoration(labelText: 'Add an item'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: addItemToList,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: editingIndex == index
                    ? TextField(
                        controller: itemController,
                        onSubmitted: (value) => saveEdit(index),
                      )
                    : Text(items[index]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (editingIndex == index)
                      IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () => saveEdit(index),
                      )
                    else
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => startEditing(index),
                      ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => removeItem(index),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
