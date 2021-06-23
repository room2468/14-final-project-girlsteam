import 'package:flutter/material.dart';
import 'barangrusak.dart';

class EntryForm extends StatefulWidget {
  final Rusak itemrusak;
  EntryForm(this.itemrusak);
  @override
  EntryFormState createState() => EntryFormState(this.itemrusak);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Rusak itemrusak;
  EntryFormState(this.itemrusak);
  TextEditingController kodebarangController = TextEditingController();
  TextEditingController satuanController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //kondisi

    if (itemrusak != null) {
      kodebarangController.text = itemrusak.kodebarang;
      satuanController.text = itemrusak.satuan;
      keteranganController.text = itemrusak.keterangan;
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: itemrusak == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          // serial number
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: kodebarangController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Kode Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // nama item yang akan dimasukkan
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: satuanController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Satuan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // memasukkan stok
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: keteranganController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Keterangan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: ElevatedButton(
                        // textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (itemrusak == null) {
                            // tambah data yang baru dimasukkan
                            itemrusak = Rusak(
                              kodebarangController.text,
                              satuanController.text,
                              keteranganController.text,
                            );
                          } else {
                            // untuk mengubah data
                            itemrusak.kodebarang = kodebarangController.text;
                            itemrusak.satuan = satuanController.text;
                            itemrusak.keterangan = keteranganController.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, itemrusak);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: ElevatedButton(
                        // color: Theme.of(context).primaryColorDark,
                        // textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
