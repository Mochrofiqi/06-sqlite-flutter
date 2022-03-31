import 'package:flutter/material.dart';
import 'package:db_sqlite_06/Model/item.dart';
import 'package:db_sqlite_06/Database/dbhelper.dart';
import 'entry_form.dart';

class ItemList extends StatefulWidget {
  final List<Item> itemData;

  const ItemList(this.itemData, {Key? key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  void delete(Item item) {
    var db = DBHelper();
    db.deleteItem(item);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemData.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Color.fromARGB(255, 240, 237, 237),
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              textColor: Colors.black,
              leading: const CircleAvatar(
                backgroundColor: Colors.brown,
                child: Icon(Icons.group),
              ),
              title: Text(
                widget.itemData[index].name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.itemData[index].price.toString(),
                    style: const TextStyle(fontSize: 17),
                  ),
                  Text(widget.itemData[index].stok.toString(),
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
              trailing: GestureDetector(
                child: const Icon(Icons.delete),
                onTap: () {
                  delete(widget.itemData[index]);
                },
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => EntryForm(
                      widget.itemData[index],
                      false,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
