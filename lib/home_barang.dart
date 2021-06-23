import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:berise/DBhelper.dart';
import 'package:berise/entryform_barang.dart';
import 'barang.dart';

//pendukung program asinkron
class HomeBarang extends StatefulWidget {
  @override
  HomeBarangState createState() => HomeBarangState();
}

class HomeBarangState extends State<HomeBarang> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Barang> barangList;

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    if (barangList == null) {
      barangList = [];
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
                var barang = await navigateToEntryForm(context, null);
                if (barang != null) {
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
      return EntryForm(barang);
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
              this.barangList[index].id.toString() +
                  "-" +
                  this.barangList[index].kodebarang,
              style: textStyle,
            ),
            subtitle: Text(this.barangList[index].keterangan),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                dbHelper.deleteBarang(this.barangList[index].id);
                updateListView();
              },
            ),
            onTap: () async {
              var data =
                  await navigateToEntryForm(context, this.barangList[index]);
              int result = await dbHelper.updateBarang(data);
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
      Future<List<Barang>> itemListFuture = dbHelper.getBarangList();
      itemListFuture.then((itemList) {
        setState(() {
          this.barangList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
