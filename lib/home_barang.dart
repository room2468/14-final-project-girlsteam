import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:berise/DBhelper.dart';
import 'package:berise/entryform_barang.dart';
import 'barang.dart';

//pendukung program asinkron
class BarangPage extends StatefulWidget {
  @override
  BarangPageState createState() => BarangPageState();
}

class BarangPageState extends State<BarangPage> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Barang> itemList;
  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = List<Barang>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Item'),
      ),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text("Tambah Item"),
              onPressed: () async {
                var barang = await navigateToEntryForm(context, null);
                if (barang != null) {
                  //TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelper.insertBarang(barang);
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

  Future<Barang> navigateToEntryForm(
      BuildContext context, Barang barang) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryFormBarang(barang);
    }));
    return result;
  }

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
              this.itemList[index].kodebarang,
              style: textStyle,
            ),
            subtitle: Text(this.itemList[index].stok.toString()),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3 Panggil Fungsi untuk Hapus data
                deleteItem(itemList[index]);
              },
            ),
            onTap: () async {
              var item =
                  await navigateToEntryForm(context, this.itemList[index]);
              //TODO 4 Panggil Fungsi untuk Edit data
              if (item != null) editItem(item);
            },
          ),
        );
      },
    );
  }

//edit contact
  void editItem(Barang object) async {
    int result = await dbHelper.updateBarang(object);
    if (result > 0) {
      updateListView();
    }
  }

//delete item
  void deleteItem(Barang object) async {
    int result = await dbHelper.deleteBarang(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  //update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Barang>> itemListFuture = dbHelper.getBarangList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
