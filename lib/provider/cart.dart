


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dema_app/services/database.dart';


class Cart with ChangeNotifier {
  DbHelper dbHelper=DbHelper();
  //var dbHelper=DbHelper.db;
 // int quantity=1.abs();
  TextEditingController controller=TextEditingController();
  // int _periodic=0;
  // int get periodic=>_periodic;
  // int _price=0;
  // int get price=>_price;
  // double _totalPrice=0.0;
  // double get totalPrice=>_totalPrice;
  //
  // late SharedPreferences prefs;
  // final _key = 'periodic';
  // final key = 'perice';
  // final keyTotalPrice = 'totalPerice';

  // int _totalPrice=1;
  // int get totalPrice=>_totalPrice;
  /*
   late Future<List<CartModel>>_cart;
  Future<List<CartModel>> get cart=>_cart;
  Future<List<CartModel>>getData()async{
    // _looding.value=true;
    // _cart=await dbHelper.getCartList();
    // _looding.value=false;
    // notifyListeners();
   _cart=dbHelper.getCartList();
    return _cart;
  }

   */
 // late SharedPreferences prefs;
  // final _key = 'periodic';
  // final key = 'perice';
  // final keyTotalPrice = 'totalPerice';
  /*
  addPeriodic() async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((pref) {
      pref.setInt(_key, _periodic);
    });
  }

  addPrice() async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((pref) {
      pref.setInt(key, _price);
    });
  }

  addTotalPrice() async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((pref) {
      pref.setDouble(keyTotalPrice,
          ((_price).toDouble() * _periodic.toDouble()));
    });
  }

  getPeriodic() async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((pref) {
      pref.getInt(_key);
    });
  }

  getPerice() async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((pref) {
      pref.getInt(key);
    });
  }

  getTotalPerice() async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((pref) {
      pref.getInt(keyTotalPrice);
    });
  }

  removeCounter(){
    _periodic--;
    addPeriodic();
    addPrice();
    addTotalPrice();
    notifyListeners();
  }
  addCounter(){
    _periodic++;
    addPeriodic();
    addPrice();
    addTotalPrice();
    notifyListeners();
  }



   */

  /*
  addProduct(CartModel cartModel)async{

    for(int i=0;i<_cart.length;i++){
      if(_cart[i].productId==cartModel.productId){
        //بقوله لو فيه عنصر بنفس القيمه دى المفروض مااضفش معملش insert فى الداتابيز
        return;
      }
    }
    var dbHelper=DbHelper();
    await dbHelper.insertCart(cartModel);
    _cart.add(cartModel);
    notifyListeners();
    // insert(cartProductModel);
    // _cartProductModel.add(cartProductModel);
    // _totalPrice += (double.parse(cartProductModel.price!) *cartProductModel.quantity);
    //
    // update();
  }
  */
  // increaseQuantity(int index)async{
  //   _cart[index].quantity=(_cart[index].quantity)!+1;
  // //  _totalPrice += (double.parse(_cartProductModel[index].price!));
  //   await dbHelper.updatePeriodic(_cart[index]);
  //   notifyListeners();
  // }
  // decreaseQuantity(int index)async{
  //   _cart[index].quantity=(_cart[index].quantity)!-1;
  //   //_totalPrice -= (double.parse(_cartProductModel[index].price!) );
  //   await dbHelper.updatePeriodic(_cart[index]);
  //   notifyListeners();
  // }
  // int quantity(){
  //   if(_cart.toString().isEmpty){
  //     return 0;
  //   }else {
  //     return _cart.toString().length;
  //     // map((e) => e.value).toList().reduce((value,
  //     //     element) => value + element);
  //   }
  //
  // }


  // void _setPrefItems()async{
  //   Future<SharedPreferences> prefs=SharedPreferences.getInstance();
  //   prefs.then((pref){
  //     pref.setInt('cart_item', _quantity);
  //     pref.setDouble('total_price', _totalPrice);
  //     pref.setDouble('price', _price);
  //   });
  //
  //  // prefs.setInt('total_price', _totalPrice);
  //   notifyListeners();
  // }
  // void _getPrefItems()async{
  //   Future<SharedPreferences> prefs=SharedPreferences.getInstance();
  //   prefs.then((pref){
  //     _quantity=pref.getInt('cart_item')?? 0 ;
  //     _price=pref.getDouble('price')?? 0.0 ;
  //     _totalPrice=pref.getDouble('total_price')?? 0.0 ;
  //   });
  //
  //  // _totalPrice=prefs.getInt('total_price')?? 1;
  //  // notifyListeners();
  // }
  // addCounter(){
  //   _periodic++;
  //    _setPrefItems();
  //   notifyListeners();
  // }
  //
  // int getCounter(){
  //   _getPrefItems();
  //   return _periodic;
  // }
  // addTotalPrice(double productPrice){
  //   _totalPrice+=productPrice;
  //   _setPrefItems();
  //   notifyListeners();
  // }
  // RemoveTotalPrice(double productPrice){
  //   _totalPrice-=productPrice;
  //   _setPrefItems();
  //   notifyListeners();
  // }
  // double getTotalPrice(){
  //   _getPrefItems();
  //   return _totalPrice;
  // }

  //هنا بحط الداتا الى عاوز اوصل لها من اى صفحه
  List<QueryDocumentSnapshot>categories = [];

  //double price=10;
  void add(QueryDocumentSnapshot object) {
    categories.add(object);
    notifyListeners();
  }
}
//   addProduct(QueryDocumentSnapshot object)async{
//
//     for(int i=0;i<categories.length;i++){
//       if(categories[i].id==object[i].id){
//         //بقوله لو فيه عنصر بنفس القيمه دى المفروض مااضفش معملش insert فى الداتابيز
//         return;
//       }
//     }
//     var dbHelper=CartDatabaseHelper.db;
//     await dbHelper.insert(object);
//     categories.add(object);
//     //_totalPrice += (double.parse(cartProductModel.price!) *cartProductModel.quantity);
//
//     notifyListeners();
//
//   }
// }
//
// class Cart with ChangeNotifier{
//   //هنا بحط الداتا الى عاوز اوصل لها من اى صفحه
//   List<DatabaseEvent>categories=[];
//   //double price=10;
//   void add(DatabaseEvent object){
//     categories.add(object);
//     notifyListeners();
//   }
// }