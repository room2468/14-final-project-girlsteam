import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'barang.dart';
import 'supplier.dart';
import 'barangrusak.dart';
import 'package:berise/barang.dart';
import 'package:berise/supplier.dart';
import 'package:berise/barangrusak.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

    //create, read databases
    var itemDatabase = openDatabase(path,
        version: 1, onCreate: _createDb, onUpgrade: _onUpgrade);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //update tabel
  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _createDb(db, newVersion);
  }

  //buat tabel baru dengan nama stok dan deskripsi
  void _createDb(Database db, int version) async {
    var batch = db.batch();
    batch.execute('DROP TABLE IF EXISTS barang');
    batch.execute('DROP TABLE IF EXISTS supplier');
    batch.execute('DROP TABLE IF EXISTS barangrusak');
    batch.execute('''
      CREATE TABLE barang (
     id INTEGER PRIMARY KEY AUTOINCREMENT,
 kodebarang TEXT,
 satuan TEXT,
 stok INTEGER,
 keterangan TEXT
      )
    ''');
    batch.execute('''
      CREATE TABLE supplier (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
 nama TEXT,
 alamat TEXT,
 notelepon INTEGER
      )
    ''');
    batch.execute('''
      CREATE TABLE barangrusak (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
 kodebarang TEXT,
 satuan TEXT,
 keterangan TEXT
      )
    ''');
    await batch.commit();
  }

//select databases
  Future<List<Map<String, dynamic>>> selectBarang() async {
    Database db = await this.initDb();
    var mapList = await db.query('barang',
        orderBy: 'kodebarang'); //nampilin data dari table diurutkan dengan nama
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectSupplier() async {
    Database db = await this.initDb();
    var mapList = await db.query('supplier',
        orderBy: 'nama'); //nampilin data dari table diurutkan dengan nama
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectRusak() async {
    Database db = await this.initDb();
    var mapList = await db.query('barangrusak',
        orderBy: 'satuan'); //nampilin data dari table diurutkan dengan nama
    return mapList;
  }

//fungsi untuk mengisi data pada tabel stok
  Future<int> insertBarang(Barang object) async {
    Database db = await this.initDb();
    int count = await db.insert('barang', object.toMap());
    return count;
  }

  Future<int> insertRusak(Rusak object) async {
    Database db = await this.initDb();
    int count = await db.insert('barangrusak', object.toMap());
    return count;
  }

  Future<int> insertSupplier(Supplier object) async {
    Database db = await this.initDb();
    int count = await db.insert('supplier', object.toMap());
    return count;
  }

//fungsi untuk update data tabel
  Future<int> updateBarang(Barang object) async {
    Database db = await this.initDb();
    int count = await db.update('barang', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  // Future<int> update(Item object) async {
  //   Database db = await this.initDb();
  //   int count = await db
  //       .update('item', object.toMap(), where: 'id=?', whereArgs: [object.id]);
  //   return count;
  // }

  Future<int> updateRusak(Rusak object) async {
    Database db = await this.initDb();
    int count = await db.update('barangrusak', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  Future<int> updateSupplier(Supplier object) async {
    Database db = await this.initDb();
    int count = await db.update('supplier', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //fungsi untuk menghapus data tabel
  Future<int> deleteBarang(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('barang', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<int> deleteRusak(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('barangrusak', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<int> deleteSupplier(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('supplier', where: 'id=?', whereArgs: [id]);
    return count;
  }

  //fungsi untuk mengembalikan nilai data yang baru dimasukkan
  Future<List<Barang>> getBarangList() async {
    var barangMapList = await selectBarang();
    int count = barangMapList.length;
    List<Barang> barangList = [];
    for (int i = 0; i < count; i++) {
      barangList.add(Barang.fromMap(barangMapList[i]));
    }
    return barangList;
  }

  Future<List<Rusak>> getRusakList() async {
    var rusakMapList = await selectRusak();
    int count = rusakMapList.length;
    List<Rusak> rusakList = [];
    for (int i = 0; i < count; i++) {
      rusakList.add(Rusak.fromMap(rusakMapList[i]));
    }
    return rusakList;
  }

  Future<List<Supplier>> getSupplierList() async {
    var supplierMapList = await selectSupplier();
    int count = supplierMapList.length;
    List<Supplier> supplierList = [];
    for (int i = 0; i < count; i++) {
      supplierList.add(Supplier.fromMap(supplierMapList[i]));
    }
    return supplierList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
