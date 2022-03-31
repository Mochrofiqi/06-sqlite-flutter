import 'package:flutter/material.dart';
import 'package:db_sqlite_06/Pages/item_list.dart';
import 'package:db_sqlite_06/Pages/entry_form.dart';
import 'package:db_sqlite_06/Database/dbhelper.dart';
import 'package:db_sqlite_06/Model/item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => EntryForm(
                  Item('', '', 0, 0),
                  true,
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Daftar Item | Moch. Rofiqi (2031710135)'),
        ),
        body: FutureBuilder(
          future: db.getItem(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }

            var data = snapshot.data;

            return snapshot.hasData
                ? ItemList(data as List<Item>)
                : const Center(
                    child: Text('Tidak Ada Data'),
                  );
          },
        ));
  }
}
