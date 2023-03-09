// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_dema_app/model/cart_model.dart';
// import 'package:flutter_dema_app/provider/cart.dart';
// import 'package:flutter_dema_app/services/database.dart';
// import 'package:my_fatoorah/my_fatoorah.dart';
// import 'package:provider/provider.dart';
//
// class CartItemScreen extends StatefulWidget {
//   final CartModel cartModel;
//   const CartItemScreen({Key? key,required this.cartModel})
//       : super(key: key);
//
//   @override
//   State<CartItemScreen> createState() => _CartItemScreenState();
// }
//
// class _CartItemScreenState extends State<CartItemScreen> {
//   // int selectedPrice = 1;
//   // late int selectedPeriodic;
//   //
//   // var periodicList = List<int>.generate(100, (i) => i + 1);
//   // var priceList = List<int>.generate(1000, (i) => i + 1);
//   // late String dropdownValue;
//   /*
//   late SharedPreferences prefs;
//   final _key = 'periodic';
//   final key = 'perice';
//   final keyTotalPrice = 'totalPerice';
//   addPeriodic() async {
//     Future<SharedPreferences> prefs = SharedPreferences.getInstance();
//     prefs.then((pref) {
//       pref.setInt(_key, widget.quantity);
//     });
//   }
//
//   addPrice() async {
//     Future<SharedPreferences> prefs = SharedPreferences.getInstance();
//     prefs.then((pref) {
//       pref.setInt(key, widget.price);
//     });
//   }
//
//   addTotalPrice() async {
//     Future<SharedPreferences> prefs = SharedPreferences.getInstance();
//     prefs.then((pref) {
//       pref.setDouble(keyTotalPrice,
//           ((widget.price).toDouble() * widget.quantity.toDouble()));
//     });
//   }
//
//   getPeriodic() async {
//     Future<SharedPreferences> prefs = SharedPreferences.getInstance();
//     prefs.then((pref) {
//       pref.getInt(_key);
//     });
//   }
//
//   getPerice() async {
//     Future<SharedPreferences> prefs = SharedPreferences.getInstance();
//     prefs.then((pref) {
//       pref.getInt(key);
//     });
//   }
//
//   getTotalPerice() async {
//     Future<SharedPreferences> prefs = SharedPreferences.getInstance();
//     prefs.then((pref) {
//       pref.getInt(keyTotalPrice);
//     });
//   }
//
//    */
//
//   @override
//   void initState() {
//     super.initState();
//     // getPeriodic();
//     // getPerice();
//     // getPeriodic();
//
//     // _read(); // read in initState
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     DbHelper dbHelper = DbHelper();
//     //int totalPreice=widget.price*widget.quantity;
//     final cartInstance = Provider.of<Cart>(context);
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         title: const Align(
//           alignment: Alignment.topRight,
//           child: Padding(
//             padding: EdgeInsets.only(right: 10),
//             child: Text(
//               " سلة ألخير ",
//               style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.green,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 15),
//           child: IconButton(
//             onPressed: () async {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.black54,
//               size: 20,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             FutureBuilder(
//                 future: cartInstance.getData(),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<List<CartModel>> snapshot) {
//                   if (snapshot.hasData) {
//                     if (snapshot.data!.isEmpty) {
//                       return Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               'assets/images/phone_charity.png',
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               'صندوق التبرع فارغ',
//                               style: Theme
//                                   .of(context)
//                                   .textTheme
//                                   .headline6,
//                             ),
//                           ],
//                         ),
//                       );
//                     } else {
//                       return Expanded(
//                         child:ListView.separated(
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: (context, int index){
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),
//                                     border: Border.all(color: Colors.grey),
//                                   ),
//                                   height: 160,
//                                   width: 450,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     // mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.end,
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Padding(
//                                                 padding: const EdgeInsets.only(left: 10.0,top: 20),
//                                                 child: Row(
//                                                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                   children: [
//                                                     const Text("ر.س",
//                                                       style: TextStyle(
//                                                         fontSize: 17,
//                                                         fontWeight: FontWeight.w700,
//                                                         color: Colors.green,
//                                                       ),),
//                                                     const SizedBox(width: 4,),
//                                                     Text(
//                                                       "${(widget.cartModel.totalPrice)}",
//                                                      // ""${(widget.cartModel.quantity)!*(widget.cartModel.price)!}""
//                                                       style: const TextStyle(
//                                                         fontSize: 17,
//                                                         fontWeight: FontWeight.w700,
//                                                         color: Colors.green,
//                                                       ),
//                                                     ),
//
//                                                   ],
//                                                 ),
//                                               ),
//                                               const SizedBox(width: 100,),
//                                               Text(
//                                                 snapshot.data![index].productName
//                                                     .toString(),
//                                                 style: const TextStyle(
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w700,
//                                                   color: Colors.green,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(height:10,),
//                                           Padding(
//                                             padding: const EdgeInsets.only(left: 10.0),
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 InkWell(
//                                                     onTap: () {
//                                                       setState(() {
//                                                         dbHelper.delete(snapshot
//                                                             .data![index].id!);
//                                                         // cartInstance.removeCounter();
//                                                       });
//
//                                                     },
//                                                     child: Card(
//                                                       child: Container(
//                                                         height: 41,
//                                                         width: 41,
//                                                         decoration:BoxDecoration(
//                                                             borderRadius: BorderRadius.circular(10)
//                                                         ) ,
//                                                         child:  const Icon(Icons.delete,color: Colors.red,size: 30,),
//                                                       ),
//                                                     )),
//                                                 const SizedBox(width: 20,),
//                                                 Column(
//                                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                                   children: [
//                                                     Row(
//                                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                       children: [
//                                                         const Text("ر.س",
//                                                           style: TextStyle(
//                                                             fontSize: 17,
//                                                             fontWeight: FontWeight.w700,
//                                                             color: Colors.black54,
//                                                           ),),
//                                                         const SizedBox(width: 4,),
//                                                         Text(
//                                                           "${widget.cartModel.price}",
//                                                           style: const TextStyle(
//                                                             fontSize: 17,
//                                                             fontWeight: FontWeight.w700,
//                                                             color: Colors.black54,
//                                                           ),
//                                                         ),
//                                                         const SizedBox(width:5,),
//                                                         const Text(
//                                                           "قيمة التبرع اليومى",
//                                                           style: TextStyle(
//                                                             fontSize: 17,
//                                                             fontWeight: FontWeight.w700,
//                                                             color: Colors.black,
//                                                           ),
//                                                         ),
//
//                                                       ],
//                                                     ),
//                                                     const SizedBox(height: 10,),
//                                                     Row(
//                                                       children: [
//                                                         Text(
//                                                           "${widget.cartModel.quantity}",
//                                                           style: const TextStyle(
//                                                             fontSize: 17,
//                                                             fontWeight: FontWeight.w700,
//                                                             color: Colors.black54,
//                                                           ),
//                                                         ),
//                                                         const SizedBox(width:5,),
//                                                         const Text(
//                                                           "عدد أيام التبرع",
//                                                           style: TextStyle(
//                                                             fontSize: 17,
//                                                             fontWeight: FontWeight.w700,
//                                                             color: Colors.black,
//                                                           ),
//                                                         ),
//
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//
//
//                                               ],
//                                             ),
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       ClipRRect(
//                                         borderRadius: const BorderRadius.only(
//                                             topRight: Radius.circular(15),
//                                             bottomRight: Radius.circular(15)),
//                                         child: FadeInImage.assetNetwork(
//                                             fit: BoxFit.fill,
//                                             height: 160,
//                                             width: 100,
//                                             placeholder: 'assets/images/loading.gif',
//                                             image: snapshot
//                                                 .data![index].image
//                                                 .toString()
//                                           //.['pImage']!
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 /*
//                                   Card(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               Image(
//                                                 height: 100,
//                                                 width: 100,
//                                                 image: NetworkImage(snapshot
//                                                     .data![index].image
//                                                     .toString()),
//                                               ),
//                                               const SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Expanded(
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                       children: [
//                                                         Text(
//                                                           snapshot
//                                                               .data![index].productName
//                                                               .toString(),
//                                                           style: const TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight: FontWeight.w500,
//                                                           ),
//                                                         ),
//                                                         InkWell(
//                                                             onTap: () {
//                                                               setState(() {
//                                                                 dbHelper.delete(snapshot
//                                                                     .data![index].id!);
//                                                                 cartInstance.removeCounter();
//                                                               });
//
//                                                             },
//                                                             child: const Icon(Icons.delete,color: Colors.red,)),
//                                                       ],
//                                                     ),
//                                                     const SizedBox(
//                                                       height: 5,
//                                                     ),
//
//                                                     const SizedBox(
//                                                       height: 5,
//                                                     ),
//                                                     Align(
//                                                       alignment: Alignment.centerRight,
//                                                       child: InkWell(
//                                                         onTap: () {},
//                                                         child: Container(
//                                                           height: 40.0,
//                                                           width: 150,
//                                                           decoration: const BoxDecoration(
//                                                             color: Colors.green,
//                                                           ),
//                                                           child: Row(
//                                                             mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                             children: [
//                                                               InkWell(
//                                                                   onTap: () {
//                                                                     int quantity = snapshot.data![index].quantity!;
//                                                                     //  int price = snapshot.data![index].initialPrice!;
//                                                                     setState(() {
//                                                                       quantity--;
//                                                                     });
//                                                                     if(quantity >0){
//                                                                       dbHelper.updatePeriodic(
//                                                                         CartModel(
//                                                                           id: snapshot.data![index].id,
//                                                                           productId: snapshot.data![index].productId,
//                                                                           productName: snapshot.data![index].productName.toString(),
//                                                                           quantity:quantity,
//                                                                           image: snapshot.data![index].image.toString(),
//                                                                         ),
//                                                                       ).then((value) {
//
//                                                                         quantity=0;
//                                                                       }).onError((error, stackTrace) {
//                                                                         if (kDebugMode) {
//                                                                           print(error.toString());
//                                                                         }
//                                                                       });
//                                                                     }
//                                                                   },
//                                                                   child: const Icon(
//                                                                     Icons.remove,
//                                                                     color: Colors.white,
//                                                                   )),
//                                                               Row(
//                                                                 children: [
//                                                                   Text(
//                                                                     snapshot.data![index]
//                                                                         .quantity
//                                                                         .toString(),
//                                                                     style: const TextStyle(
//                                                                         color:
//                                                                         Colors.white),
//                                                                   ),
//                                                                   const SizedBox(width: 5,),
//                                                                   const Text(
//                                                                     "SAR",
//                                                                     style: TextStyle(
//                                                                         color:
//                                                                         Colors.white),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                               InkWell(
//                                                                   onTap: () {
//                                                                     int quantity = snapshot.data![index].quantity!;
//                                                                     setState(() {
//                                                                       quantity++;
//                                                                     });
//
//                                                                     // int? newPrice=price*quantity;
//                                                                     dbHelper.updatePeriodic(
//                                                                       CartModel(
//                                                                         id: snapshot.data![index].id,
//                                                                         productId: snapshot.data![index].productId,
//                                                                         productName: snapshot.data![index].productName.toString(),
//
//                                                                         image: snapshot.data![index].image.toString(),
//                                                                         quantity: quantity,
//                                                                       ),
//                                                                     ).then((value) {
//                                                                       // newPrice=0;
//                                                                       quantity=0;
//                                                                       // cart.addTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
//                                                                     }).onError((error, stackTrace) {
//                                                                       if (kDebugMode) {
//                                                                         print(error.toString());
//                                                                       }
//                                                                     });
//                                                                   },
//                                                                   child: const Icon(
//                                                                     Icons.add,
//                                                                     color: Colors.white,
//                                                                   )),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     const SizedBox(
//                                                       height: 5,
//                                                     ),
//                                                     Align(
//                                                       alignment: Alignment.centerRight,
//                                                       child: InkWell(
//                                                         onTap: () {},
//                                                         child: Container(
//                                                           padding: const EdgeInsets.all(8.0),
//                                                           height: 40.0,
//                                                           width: 180,
//                                                           decoration: const BoxDecoration(
//                                                             color: Colors.green,
//                                                           ),
//                                                           child: Row(
//                                                             mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                             children: [
//                                                               DropdownButton<String>(
//                                                                 value: dropdownValue,
//                                                                 onChanged: (String ?newValue) {
//                                                                   setState(() {
//                                                                     dropdownValue = newValue!;
//                                                                   });
//                                                                   prefs.setString(_key, dropdownValue); // save value to SharedPreference
//                                                                 },
//                                                                 items: ['يوم', 'شهر', 'سنه'].map<DropdownMenuItem<String>>((String value) {
//                                                                   return DropdownMenuItem<String>(
//                                                                     value: value,
//                                                                     child: Text(value),
//                                                                   );
//                                                                 }).toList(),
//                                                               ),
//                                                               DropdownButton<int>(
//                                                                 value: selectedPeriodic,
//                                                                 onChanged: (int ?newValue) {
//                                                                   setState(() {
//                                                                     selectedPeriodic = newValue!;
//                                                                   });
//                                                                   prefs.setInt(key, selectedPeriodic); // save value to SharedPreference
//                                                                 },
//                                                                 items: periodicList.map<DropdownMenuItem<int>>((int value) {
//                                                                   return DropdownMenuItem<int>(
//                                                                     value: value,
//                                                                     child: Text("$value"),
//                                                                   );
//                                                                 }).toList(),
//                                                               ),
//                                                               const Text("المدة",style:TextStyle(fontSize: 17,color: Colors.white),),
//
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   */
//                               ]
//                               ,
//                             );
//                           },
//                             separatorBuilder: (context, int index){
//                             return const SizedBox(height: 25);
//                             }
//                             ),
//                       );
//                     }
//                   }
//                   return const Text('');
//                 }),
//             InkWell(
//               onTap: () async {
//                 var response = await MyFatoorah.startPayment(
//                   context: context,
//                   request: MyfatoorahRequest.test(
//                       currencyIso: Country.SaudiArabia,
//                       successUrl:
//                       'https://momentumacademy.net/wp-content/uploads/2020/05/Paymentsuccessful21.png',
//                       //'https://www.facebook.com',
//                       errorUrl: 'https://www.google.com/',
//                       invoiceAmount: 100,
//                       language: ApiLanguage.English,
//                       //token from api token in site myfatoraa https://myfatoorah.readme.io/docs/demo-information
//                       token:
//                       'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL'),
//                 );
//                 log(response.paymentId.toString());
//                 //فى حاله الدفع
//                 log(response.status.toString());
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Container(
//                   width: 220,
//                   decoration: BoxDecoration(
//                     color: Colors.teal,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: const Text(
//                     ' التبرع الأن',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 25,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// /*
// SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             Container(
//               child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                   physics: const BouncingScrollPhysics(),
//                   padding: const EdgeInsets.all(8),
//                   itemCount: cartInstance.categories.length,
//                   itemBuilder: (context,index){
//                     return Padding(
//                       padding: const EdgeInsets.all(5),
//                       child: Container(
//                         height: 470,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Column(
//                           children: [
//                             ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child: FadeInImage.assetNetwork(
//                                     fit: BoxFit.fill,
//                                     height: 300,
//                                     width: double.infinity,
//                                     placeholder: 'assets/images/loading.gif',
//                                     image: cartInstance.categories[index]["pImage"].toString()
//                                     //cartInstance.categories[index]["pImage"].toString()
//                                     //["pImage"],
//                                   ),
//                                 ),
//                             const SizedBox(height: 20,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   width: 350,
//                                   decoration:  BoxDecoration(
//                                     color: Colors.teal,
//                                     borderRadius: BorderRadius.circular(30),
//
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       IconButton(
//                                           onPressed: (){
//                                             setState(() {
//                                               selectedPrice--;
//                                             });
//                                           },
//                                           icon: const Icon(Icons.remove_circle,color: Colors.black,size: 30,)
//                                       ),
//                                       const SizedBox(width: 30,),
//                                       Text('SAR $selectedPrice مبلغ التبرع ',style: const TextStyle(color: Colors.black,fontSize: 25,),),
//                                       const SizedBox(width: 30,),
//                                       IconButton(
//                                           onPressed: (){
//                                             setState(() {
//                                               selectedPrice++;
//                                             });
//                                           },
//                                           icon: const Icon(Icons.add_circle,color: Colors.black,size: 30,)
//                                       ),
//
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20,),
//                                 Container(
//                                   width: 350,
//                                   decoration:  BoxDecoration(
//                                     color: Colors.teal,
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       DropdownButton(
//                                         // value: selectedPeriodic,
//                                           items: statusPeriodic.map((status) {
//                                             return DropdownMenuItem(
//                                               value: (status),
//                                               child: Text(status),
//                                             );
//                                           }).toList(),
//                                           onChanged: (value){
//                                             setState(() {
//                                               selectedPeriodicTime=value.toString();
//                                             });
//                                           }
//                                       ),
//                                       const SizedBox(width: 20,),
//                                       Text(selectedPeriodicTime,style: const TextStyle(color: Colors.black,fontSize: 25,),),
//                                       const SizedBox(width: 20,),
//                                       DropdownButton(
//                                         // value: selectedPeriodic,
//                                           items: periodicList.map((periodic) {
//                                             return DropdownMenuItem(
//                                               value: (periodic),
//                                               child: Text(periodic.toString(),style: const TextStyle(color: Colors.black,fontSize: 25,),),
//                                             );
//                                           }).toList(),
//                                           value: selectedPeriodic,
//                                           onChanged: (int? value){
//                                             setState(() {
//                                               selectedPeriodic=value! ;
//                                             });
//                                           }
//
//                                       ),
//                                       //Text('$periodic'),
//                                       const Text('المدة',style:  TextStyle(color: Colors.black,fontSize: 25,),),
//
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                           ],
//                         ),
//                       ),
//                      //  Container(
//                      //    decoration: BoxDecoration(
//                      //        borderRadius: BorderRadius.circular(15),
//                      //        color: Colors.white54,
//                      //        boxShadow: [
//                      //          BoxShadow(
//                      //            color: Colors.grey.withOpacity(0.2),
//                      //            spreadRadius: 3.0,
//                      //            blurRadius: 5.0,
//                      //          ),
//                      //        ]),
//                      //    child: Row(
//                      //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      //      children: [
//                      //        /*  Consumer<Cart>(builder: (context,cartInstance,child){
//                      //    return  InkWell(
//                      //      onTap: (){
//                      //        cartInstance.add(categories[index]);
//                      //      },
//                      //      child: Container(
//                      //          height: 60,
//                      //          width: 80,
//                      //          decoration: BoxDecoration(
//                      //            color: Colors.orange,
//                      //            borderRadius: BorderRadius.circular(20),
//                      //          ),
//                      //          child:Row(
//                      //            children: const [
//                      //              Text('أضافه',style: TextStyle(fontSize: 17,color: Colors.white),),
//                      //              Icon(Icons.add_circle,color: Colors.teal,),
//                      //            ],
//                      //          )
//                      //      ),
//                      //    );
//                      //  }),
//                      //
//                      // */
//                      //        Column(
//                      //          crossAxisAlignment: CrossAxisAlignment.center,
//                      //          mainAxisAlignment: MainAxisAlignment.center,
//                      //          children: [
//                      //            Container(
//                      //              width: 150,
//                      //              decoration:  BoxDecoration(
//                      //                color: Colors.teal,
//                      //                borderRadius: BorderRadius.circular(10),
//                      //
//                      //              ),
//                      //              child: Row(
//                      //                mainAxisAlignment: MainAxisAlignment.center,
//                      //                children: [
//                      //                  IconButton(
//                      //                      onPressed: (){
//                      //                        setState(() {
//                      //                          selectedPrice--;
//                      //                        });
//                      //                      },
//                      //                      icon: const Icon(Icons.remove_circle,color: Colors.black,size: 30,)
//                      //                  ),
//                      //                  const SizedBox(width: 10,),
//                      //                  DropdownButton(
//                      //                    // value: selectedPeriodic,
//                      //                      items: statusCoins.map((status) {
//                      //                        return DropdownMenuItem(
//                      //                          value: (status),
//                      //                          child: Text(status),
//                      //                        );
//                      //                      }).toList(),
//                      //                      onChanged: (value){
//                      //                        setState(() {
//                      //                          selectedCoin=value.toString();
//                      //                        });
//                      //                      }
//                      //                  ),
//                      //                  Text('$selectedPrice مبلغ  ',style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
//                      //                  const SizedBox(width: 10,),
//                      //                  IconButton(
//                      //                      onPressed: (){
//                      //                        setState(() {
//                      //                          selectedPrice++;
//                      //                        });
//                      //                      },
//                      //                      icon: const Icon(Icons.add_circle,color: Colors.black,size: 20,)
//                      //                  ),
//                      //
//                      //                ],
//                      //              ),
//                      //            ),
//                      //            const SizedBox(height: 20,),
//                      //            Container(
//                      //              width: 150,
//                      //              decoration:  BoxDecoration(
//                      //                color: Colors.teal,
//                      //                borderRadius: BorderRadius.circular(30),
//                      //              ),
//                      //              child: Row(
//                      //               // mainAxisAlignment: MainAxisAlignment.center,
//                      //                children: [
//                      //                  DropdownButton(
//                      //                    // value: selectedPeriodic,
//                      //                      items: statusPeriodic.map((status) {
//                      //                        return DropdownMenuItem(
//                      //                          value: (status),
//                      //                          child: Text(status),
//                      //                        );
//                      //                      }).toList(),
//                      //                      onChanged: (value){
//                      //                        setState(() {
//                      //                          selectedPeriodicTime=value.toString();
//                      //                        });
//                      //                      }
//                      //                  ),
//                      //                  const SizedBox(width: 10,),
//                      //                  Text(selectedPeriodicTime,style: const TextStyle(color: Colors.black,fontSize: 25,),),
//                      //                  const SizedBox(width: 10,),
//                      //                  DropdownButton(
//                      //                    // value: selectedPeriodic,
//                      //                      items: periodicList.map((periodic) {
//                      //                        return DropdownMenuItem(
//                      //                          value: (periodic),
//                      //                          child: Text(periodic.toString(),style: const TextStyle(color: Colors.black,fontSize: 25,),),
//                      //                        );
//                      //                      }).toList(),
//                      //                      value: selectedPeriodic,
//                      //                      onChanged: (int? value){
//                      //                        setState(() {
//                      //                          selectedPeriodic=value! ;
//                      //                        });
//                      //                      }
//                      //
//                      //                  ),
//                      //                  //Text('$periodic'),
//                      //                  const Text('المدة',style:  TextStyle(color: Colors.black,fontSize: 25,),),
//                      //
//                      //
//                      //
//                      //                ],
//                      //              ),
//                      //            ),
//                      //            const SizedBox(height: 50,),
//                      //          ],
//                      //        ),
//                      //        Expanded(
//                      //          child: Container(
//                      //            width: 170,
//                      //            height: 130,
//                      //            decoration: BoxDecoration(
//                      //              color: Colors.white,
//                      //              borderRadius: BorderRadius.circular(10),
//                      //            ),
//                      //            child: Image.asset('${cartInstance.categories[index].image}',
//                      //              fit: BoxFit.fill,
//                      //            ),
//                      //          ),
//                      //        ),
//                      //
//                      //      ],
//                      //    ),
//                      //  ),
//                     );
//                   }
//               ),
//             ) ,
//             InkWell(
//               onTap: ()async{
//                 var response = await MyFatoorah.startPayment(
//                   context: context,
//                   request: MyfatoorahRequest.test(
//                       currencyIso: Country.SaudiArabia,
//                       successUrl: 'https://momentumacademy.net/wp-content/uploads/2020/05/Paymentsuccessful21.png',
//                       //'https://www.facebook.com',
//                       errorUrl: 'https://www.google.com/',
//                       invoiceAmount: 100,
//                       language: ApiLanguage.English,
//                       //token from api token in site myfatoraa https://myfatoorah.readme.io/docs/demo-information
//                       token:'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL'
//                   ),
//                 );
//                 log(response.paymentId.toString());
//                 //فى حاله الدفع
//                 log(response.status.toString());
//               },
//               child: Container(
//                 width: 220,
//
//                 decoration:  BoxDecoration(
//                   color: Colors.teal,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: const Text(' التبرع الأن',textAlign:TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 25,),),
//               ),
//             ),
//
//
//           ],
//         ),
//       )
//  */
//
// /*
// Column(
//                         children: [
//                           Container(
//                             margin:const EdgeInsets.all(10),
//                             width: double.infinity,
//                             height: 300,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                         child: const Text("this image"),
//                         // ClipRRect(
//                         //       borderRadius: BorderRadius.circular(10),
//                         //       child: FadeInImage.assetNetwork(
//                         //         fit: BoxFit.fill,
//                         //         height: 300,
//                         //         width: double.infinity,
//                         //         placeholder: 'assets/images/loading.gif',
//                         //         image: cartInstance.categories[index]["pImage"],
//                         //       ),
//                         //     ),
//                             // child: Image.asset(
//                             //   cartInstance.categories[index].image.toString(),
//                             //   fit: BoxFit.fill,
//                             // ),
//                           ),
//                           const SizedBox(height: 20,),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: 350,
//                                 decoration:  BoxDecoration(
//                                   color: Colors.teal,
//                                   borderRadius: BorderRadius.circular(30),
//
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     IconButton(
//                                         onPressed: (){
//                                           setState(() {
//                                             selectedPrice--;
//                                           });
//                                         },
//                                         icon: const Icon(Icons.remove_circle,color: Colors.black,size: 30,)
//                                     ),
//                                     const SizedBox(width: 30,),
//                                     Text('SAR $selectedPrice مبلغ التبرع ',style: const TextStyle(color: Colors.black,fontSize: 25,),),
//                                     const SizedBox(width: 30,),
//                                     IconButton(
//                                         onPressed: (){
//                                           setState(() {
//                                             selectedPrice++;
//                                           });
//                                         },
//                                         icon: const Icon(Icons.add_circle,color: Colors.black,size: 30,)
//                                     ),
//
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 20,),
//                               Container(
//                                 width: 350,
//                                 decoration:  BoxDecoration(
//                                   color: Colors.teal,
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     DropdownButton(
//                                       // value: selectedPeriodic,
//                                         items: statusPeriodic.map((status) {
//                                           return DropdownMenuItem(
//                                             value: (status),
//                                             child: Text(status),
//                                           );
//                                         }).toList(),
//                                         onChanged: (value){
//                                           setState(() {
//                                             selectedPeriodicTime=value.toString();
//                                           });
//                                         }
//                                     ),
//                                     const SizedBox(width: 20,),
//                                     Text(selectedPeriodicTime,style: const TextStyle(color: Colors.black,fontSize: 25,),),
//                                     const SizedBox(width: 20,),
//                                     DropdownButton(
//                                       // value: selectedPeriodic,
//                                         items: periodicList.map((periodic) {
//                                           return DropdownMenuItem(
//                                             value: (periodic),
//                                             child: Text(periodic.toString(),style: const TextStyle(color: Colors.black,fontSize: 25,),),
//                                           );
//                                         }).toList(),
//                                         value: selectedPeriodic,
//                                         onChanged: (int? value){
//                                           setState(() {
//                                             selectedPeriodic=value! ;
//                                           });
//                                         }
//
//                                     ),
//                                     //Text('$periodic'),
//                                     const Text('المدة',style:  TextStyle(color: Colors.black,fontSize: 25,),),
//
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 50,),
//                               InkWell(
//                                 onTap: ()async{
//                                   var response = await MyFatoorah.startPayment(
//                                     context: context,
//                                     request: MyfatoorahRequest.test(
//                                         currencyIso: Country.SaudiArabia,
//                                         successUrl: 'https://momentumacademy.net/wp-content/uploads/2020/05/Paymentsuccessful21.png',
//                                         //'https://www.facebook.com',
//                                         errorUrl: 'https://www.google.com/',
//                                         invoiceAmount: 100,
//                                         language: ApiLanguage.English,
//                                         //token from api token in site myfatoraa https://myfatoorah.readme.io/docs/demo-information
//                                         token:'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL'
//                                     ),
//                                   );
//                                   log(response.paymentId.toString());
//                                   //فى حاله الدفع
//                                   log(response.status.toString());
//                                 },
//                                 child: Container(
//                                   width: 220,
//                                   decoration:  BoxDecoration(
//                                     color: Colors.teal,
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   child: const Text(' التبرع الأن',textAlign:TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 25,),),
//                                 ),
//                               ),
//
//
//
//                             ],
//                           ),
//                         ],
//                       )
//  */
