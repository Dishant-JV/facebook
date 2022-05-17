
import 'package:sqflite/sqflite.dart';

final String tableReadyToShip = 'readytoship';
final String id = 'id';
final String orderId = 'orderid';
final String title = 'title';
final String quantity = 'quantity';
final String color = 'color';
final String weight = 'weight';
final String size = 'size';
final String imgurl = 'imgurl';

class ReadyToShipHelper {
  static Database? _database;
  static ReadyToShipHelper? _readytoshipHelper;

  ReadyToShipHelper._createInstance();
  factory ReadyToShipHelper() {
    if (_readytoshipHelper == null) {
      _readytoshipHelper = ReadyToShipHelper._createInstance();
    }
    return _readytoshipHelper!;
  }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "readytoship.db";
    print("path");
    print(path);

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableReadyToShip ( 
          $id integer primary key autoincrement, 
          ,$color text)
        ''');
      },
    );
    return database;
  }

  void insertData(Map<String,dynamic> readyToShipModel) async {
    var db = await this.database;
    var result = await db!.insert(tableReadyToShip, readyToShipModel);
    print('result : $result');
  }

  // Future<List<ReadyToShipModel>> getReadytoshipList() async {
  //   List<ReadyToShipModel> readytoshipList = [];
  //
  //   var db = await this.database;
  //   var result = await db!.query(tableReadyToShip);
  //   result.forEach((element) {
  //     var readyToShipModel = ReadyToShipModel.fromMap(element);
  //     readytoshipList.add(readyToShipModel);
  //   });
  //
  //   return readytoshipList;
  // }

  Future<int> deleteData(int id) async {
    var db = await this.database;
    return await db!.delete(tableReadyToShip, where: '$id = ?', whereArgs: [id]);
  }
}