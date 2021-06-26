import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:berise/DBhelper.dart';
import 'package:berise/entryform_supplier.dart';
import 'supplier.dart';

//pendukung program asinkron
class HomeSupplier extends StatefulWidget {
  @override
  HomeSupplierState createState() => HomeSupplierState();
}

class HomeSupplierState extends State<HomeSupplier> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Supplier> supplierList;

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    if (supplierList == null) {
      supplierList = [];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Supplier'),
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Tambah Data"), //button tambah deskripsi
              onPressed: () async {
                var supplier = await navigateToEntryForm(context, null);
                if (supplier != null) {
                  int result = await dbHelper.insertSupplier(supplier);
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

  Future<Supplier> navigateToEntryForm(
      BuildContext context, Supplier supplier) async {
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
          color: Colors.grey,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.ad_units),
            ),
            title: Text(
              this.supplierList[index].nama +
                  "-" +
                  this.supplierList[index].alamat,
              style: textStyle,
            ),
            subtitle: Text(this.supplierList[index].notelepon.toString()),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                dbHelper.deleteSupplier(this.supplierList[index].id);
                updateListView();
              },
            ),
            onTap: () async {
              var supplier =
                  await navigateToEntryForm(context, this.supplierList[index]);
              int result = await dbHelper.updateSupplier(supplier);
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
      Future<List<Supplier>> itemListFuture = dbHelper.getSupplierList();
      itemListFuture.then((itemList) {
        setState(() {
          this.supplierList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
