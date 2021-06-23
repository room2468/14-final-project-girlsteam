import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:berise/DBhelper.dart';
import 'package:berise/entryform_barangrusak.dart';
import 'barangrusak.dart';

//pendukung program asinkron
class HomeRusak extends StatefulWidget {
  @override
  HomeRusakState createState() => HomeRusakState();
}

class HomeRusakState extends State<HomeRusak> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Rusak> rusakList;

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    if (rusakList == null) {
      rusakList = [];
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Gudang Jaringan'),
      // ),
      backgroundColor: Colors.red,
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Tambah Deskripsi"), //button tambah deskripsi
              onPressed: () async {
                var rusak = await navigateToEntryForm(context, null);
                if (rusak != null) {
                  int result = await dbHelper.insertRusak(rusak);
                  if (result > 0) {
                    updateListView();
                  }
                }
              },
            ),
          ),
        ),
      ]),
    );
  }

  Future<Rusak> navigateToEntryForm(
      BuildContext context, Rusak supplier) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(supplier);
    }));
    return result;
  }

//list view yang akan ditampilkan
  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.ad_units),
            ),
            title: Text(
              this.rusakList[index].id.toString() +
                  "-" +
                  this.rusakList[index].kodebarang,
              style: textStyle,
            ),
            subtitle: Text(this.rusakList[index].satuan),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                dbHelper.deleteRusak(this.rusakList[index].id);
                updateListView();
              },
            ),
            onTap: () async {
              var rusak =
                  await navigateToEntryForm(context, this.rusakList[index]);
              int result = await dbHelper.updateRusak(rusak);
              if (result > 0) {
                updateListView();
              }
            },
          ),
        );
      },
    );
  }

  //update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Rusak>> itemListFuture = dbHelper.getRusakList();
      itemListFuture.then((itemList) {
        setState(() {
          this.rusakList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
