import 'package:flutter/material.dart';
import 'barangrusak.dart';

class EntryFormbarangRusak extends StatefulWidget {
  final BarangRusak barangRusak;
  EntryFormbarangRusak(this.barangRusak);
  @override
  EntryFormBarangState createState() => EntryFormBarangState(this.barangRusak);
}

//class controller
class EntryFormBarangState extends State<EntryFormbarangRusak> {
  BarangRusak barangRusak;
  EntryFormBarangState(this.barangRusak);
  TextEditingController kodebarangController = TextEditingController();
  TextEditingController satuanController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //kondisi
    if (barangRusak != null) {
      kodebarangController.text = barangRusak.kodebarang;
      satuanController.text = barangRusak.satuan;
      //stokController.text = barang.stok.toString();
      keteranganController.text = barangRusak.keterangan;
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: barangRusak == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // nama
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
              //
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
              // harga

              //
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
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (barangRusak == null) {
                            // tambah data
                            //barang = Barang(
                            //  kodebarangController.text,
                            //  satuanController.text,
                            //  int.parse(stokController.text),
                            //  keteranganController.text);
                          } else {
                            // ubah data
                            kodebarangController.text;
                            satuanController.text;

                            keteranganController.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, barangRusak);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
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
