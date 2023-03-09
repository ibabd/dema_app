import 'dart:async';

import 'package:flutter_dema_app/model/cart_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DbHelper{
  static Database? _db;
  Future<Database ?>get db async{
    if(_db !=null){
      return _db;
    }else{
      _db =await initDb();
      return _db;
    }
  }

  initDb()async {
    var documentDirectory=await getApplicationDocumentsDirectory();
    String path=p.join(documentDirectory.path,'cart.db');
    var db=await openDatabase(path,version: 1,onCreate: _onCreate);
    return db;
  }

  FutureOr<void> _onCreate(Database db, int version)async {
    await db.execute('''
   CREATE TABLE cart (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    productId VARCHAR UNIQUE,
    productName TEXT,
    quantity INTEGER,
    image TEXT,
    price INTEGER,
    totalPrice INTEGER)
    ''');
  }
  Future<CartModel>insertCart(CartModel cart)async{
    var dbClient=await db;
    await dbClient!.insert('cart', cart.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
    return cart;
  }

  Future<List<CartModel>>getCartList()async{
    var dbClient=await db;
    final List<Map<String,Object?>>queryResult=await dbClient!.query('cart');
    return queryResult.map((e) =>CartModel.fromMap(e)).toList();
  }
  Future<int> delete(int id)async{
    var dbClient=await db;
    return await dbClient!.delete(
        'cart',
        where: 'id = ?',whereArgs: [id]
    );
  }
  Future<int> updatePeriodic(CartModel cart)async{
    var dbClient=await db;
    return await dbClient!.update(
        'cart',
        cart.toMap(),
        where: 'id = ?',whereArgs: [cart.id]
    );
  }

}