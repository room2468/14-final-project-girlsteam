import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'barang.dart';

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
    // batch.execute('DROP TABLE IF EXISTS stok');
    batch.execute('''
      CREATE TABLE barang (
     id INTEGER PRIMARY KEY AUTOINCREMENT,
 kodebarang TEXT,
 satuan TEXT,
 stok INTEGER,
 keterangan TEXT
      )
    ''');
//     batch.execute('''
//       CREATE TABLE stok (
//       id INTEGER PRIMARY KEY AUTOINCREMENT,
//  name TEXT,
//  price INTEGER,
// stok INTEGER
//       )
//     ''');
    await batch.commit();
  }

//select databases
  Future<List<Map<String, dynamic>>> selectBarang() async {
    Database db = await this.initDb();
    var mapList = await db.query('barang',
        orderBy: 'keterangan'); //nampilin data dari table diurutkan dengan nama
    return mapList;
  }

  // Future<List<Map<String, dynamic>>> selectStok() async {
  //   Database db = await this.initDb();
  //   var mapList = await db.query('stok',
  //       orderBy: 'kodebarang'); //nampilin data dari table diurutkan dengan nama
  //   return mapList;
  // }

//fungsi untuk mengisi data pada tabel stok
  Future<int> insertBarang(Barang object) async {
    Database db = await this.initDb();
    int count = await db.insert('barang', object.toMap());
    return count;
  }

//fungsi untuk mengisi data pada tabel deskripsi
  // Future<int> insertStok(Stok object) async {
  //   Database db = await this.initDb();
  //   int count = await db.insert('stok', object.toMap());
  //   return count;
  // }

//fungsi untuk update data tabel stok
  Future<int> updateBarang(Barang object) async {
    Database db = await this.initDb();
    int count = await db.update('barang', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//fungsi untuk update data tabel deskripsi
  // Future<int> updateStok(Stok object) async {
  //   Database db = await this.initDb();
  //   int count = await db
  //       .update('stok', object.toMap(), where: 'id=?', whereArgs: [object.id]);
  //   return count;
  // }

  //fungsi untuk menghapus data tabel stok
  Future<int> deleteBarang(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('barang', where: 'id=?', whereArgs: [id]);
    return count;
  }

//fungsi untuk menghapus data tabel deskripsi
  // Future<int> deleteStok(int id) async {
  //   Database db = await this.initDb();
  //   int count = await db.delete('stok', where: 'id=?', whereArgs: [id]);
  //   return count;
  // }

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

  // Future<List<Stok>> getStokList() async {
  //   var stokMapList = await selectStok();
  //   int count = stokMapList.length;
  //   List<Stok> stokList = [];
  //   for (int i = 0; i < count; i++) {
  //     stokList.add(Stok.fromMap(stokMapList[i]));
  //   }
  //   return stokList;
  // }

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
