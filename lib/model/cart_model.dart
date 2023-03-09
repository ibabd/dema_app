// class CartProductModel{
//   String ? name,image,price,productId
//       //day
//   ;
//   late int periodic;
//   CartProductModel({
//     required this.name,
//    // required this.day,
//     required this.image,
//     required this.price,
//     required this.periodic,
//     required this.productId,
//   });
//   CartProductModel.fromJson(Map<String,dynamic>map){
//     // ignore: unnecessary_null_comparison
//     if(map==null){
//       return ;
//     }
//     name=map['name'];
//    // day=map['day'];
//     image=map['image'];
//     price=map['price'];
//     periodic=map['periodic'];
//     productId=map['productId'];
//   }
//
//   toJson(){
//     return{
//       'name' :name,
//       //'day':day,
//       'image':image,
//       'price':price,
//       'periodic':periodic,
//       'productId':productId,
//     };
//
//   }
// }


class CartModel {
  late final int? id;
  late final String? productId;
  late final String? productName;
  late final int? quantity;
  late final String? image;
  late final int ?price;
  late final int ?totalPrice;

  CartModel(
      {
        required this.id,
        required this.productId,
        required this.productName,
        required this.quantity,
        required this.image,
        required this.price,
        required this.totalPrice,
      });

  CartModel.fromMap(Map<dynamic,dynamic>res){
    id=res['id'];
    productId=res['productId'];
    productName=res['productName'];
    quantity=res['quantity'];
    image=res['image'];
    price=res['price'];
    totalPrice=res['totalPrice'];
  }
  Map<String,Object?>toMap(){
    return{
      'id':id,
      'productId':productId,
      'productName':productName,
      'quantity':quantity,
      'image':image,
      'price':price,
      'totalPrice':totalPrice,
    };
  }




}
