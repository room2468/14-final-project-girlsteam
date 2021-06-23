import 'package:flutter/material.dart';
import 'barang.dart';

class EntryForm extends StatefulWidget {
  final Barang itembarang;
  EntryForm(this.itembarang);
  @override
  EntryFormState createState() => EntryFormState(this.itembarang);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Barang itembarang;
  EntryFormState(this.itembarang);
  TextEditingController kodebarangController = TextEditingController();
  TextEditingController satuanController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //kondisi

    if (itembarang != null) {
      kodebarangController.text = itembarang.kodebarang.toString();
      satuanController.text = itembarang.satuan;
      stokController.text = itembarang.stok.toString();
      keteranganController.text = itembarang.keterangan;
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: itembarang == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
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
              // nama
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
//entry  keterangan item/barang
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: stokController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Jumlah',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

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
                        // color: Theme.of(context).primaryColorDark,
                        // textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (itembarang == null) {
                            // tambah data
                            itembarang = Barang(
                              kodebarangController.text,
                              satuanController.text,
                              int.parse(stokController.text),
                              keteranganController.text,
                            );
                          } else {
                            // mengubah data
                            itembarang.kodebarang = kodebarangController.text;
                            itembarang.satuan = satuanController.text;
                            itembarang.stok = int.parse(stokController.text);
                            itembarang.keterangan = keteranganController.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, itembarang);
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
