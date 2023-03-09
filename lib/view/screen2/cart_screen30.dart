import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_fatoorah/my_fatoorah.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // CollectionReference fireStoreRef =
  //     FirebaseFirestore.instance.collection('users-cart-items');

  // int totalPrice=0;
  //  late Stream<QuerySnapshot> _streamCartItems;
  //  //late Stream<QuerySnapshot> _streamSubTotal;
  //  @override
  //  void initState() {
  //    super.initState();
  //    _streamCartItems= fireStoreRef.snapshots();
  //  //  _streamSubTotal= fireStoreRef.snapshots();
  //  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              " سلةالخير ",
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
              size: 20,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                      //stream:_streamCartItems,
                      stream: FirebaseFirestore.instance
                          .collection('users-cart-items')
                          .doc(FirebaseAuth.instance.currentUser!.email)
                          .collection("items")
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        if (snapshot.connectionState == ConnectionState.active) {
                          QuerySnapshot querySnapshot = snapshot.data;
                          List<QueryDocumentSnapshot> listQueryDocumentSnapshot =
                              querySnapshot.docs;
                          return SizedBox(
                            height: MediaQuery.of(context).size.height-250.h,
                            child: ListView.separated(

                              itemCount: listQueryDocumentSnapshot.length,
                              itemBuilder: (context, index) {
                                QueryDocumentSnapshot document =
                                    listQueryDocumentSnapshot[index];
                                // String subTotalPrice=(snapshot.data!.docs[index]['price'])*(snapshot.data!.docs[index]['quantity']);
                                // return Text(document['pNameProject']);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: Colors.black),
                                      ),
                                      height: 160.h,
                                      width: 450.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0,
                                                              top: 20),
                                                      child: Row(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "ر.س",
                                                            style: TextStyle(
                                                              fontSize: 17.sp,
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              color: Colors.green,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 4.w,
                                                          ),
                                                          Text(
                                                            document['totalPrice']
                                                                .toString(),
                                                            // ""${(widget.cartModel.quantity)!*(widget.cartModel.price)!}""
                                                            style: TextStyle(
                                                              fontSize: 17.sp,
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              color: Colors.green,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 100.w,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20.0),
                                                      child: Text(
                                                        document['pNameProject']
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 17.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.green,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'users-cart-items')
                                                                  .doc(FirebaseAuth
                                                                      .instance
                                                                      .currentUser!
                                                                      .email)
                                                                  .collection(
                                                                      "items")
                                                                  .doc(
                                                                      document.id)
                                                                  .delete();
                                                              // deleteCartItem(document.id);
                                                              // dbHelper.delete(snapshot
                                                              //     .data![index].id!);
                                                              // cartInstance.removeCounter();
                                                              // fireStoreRef.doc(document['pId']).delete().then((value) {
                                                              //   if (kDebugMode) {
                                                              //     print("Delete is successfully");
                                                              //   }
                                                              // }).catchError((e){if (kDebugMode) {
                                                              //   print("Error :$e");
                                                              // }});
                                                            });
                                                          },
                                                          child: Card(
                                                            child: Container(
                                                              height: 41.h,
                                                              width: 41.w,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: const Icon(
                                                                Icons.delete,
                                                                color: Colors.red,
                                                                size: 30,
                                                              ),
                                                            ),
                                                          )),
                                                      SizedBox(
                                                        width: 20.w,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                "ر.س",
                                                                style: TextStyle(
                                                                  fontSize: 17.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .black54,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              Text(
                                                                "${document['price']}",
                                                                style: TextStyle(
                                                                  fontSize: 17.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .black54,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                "قيمة التبرع اليومى",
                                                                style: TextStyle(
                                                                  fontSize: 17.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "${document['quantity']}",
                                                                style: TextStyle(
                                                                  fontSize: 17.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .black54,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                "عدد أيام التبرع",
                                                                style: TextStyle(
                                                                  fontSize: 17.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(15),
                                                      bottomRight:
                                                          Radius.circular(15)),
                                              child: FadeInImage.assetNetwork(
                                                  fit: BoxFit.fill,
                                                  height: 160.h,
                                                  width: 100.w,
                                                  placeholder:
                                                      'assets/images/loading.gif',
                                                  image: document['pImage']
                                                      .toString()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, int index) {
                                return SizedBox(height: 25.h);
                              },
                              shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                  // Expanded(child: Container())
                ],
              ),
            ),
            Positioned(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 20.h,
                                  child: FutureBuilder<QuerySnapshot>(
                                    future: FirebaseFirestore.instance
                                  .collection('users-cart-items')
                                  .doc(FirebaseAuth.instance.currentUser?.email)
                                  .collection("items")
                                  .get(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      var result = (snapshot.data!.docs
                                          .map<double>((e) =>
                                          double.parse(
                                              e['totalPrice'].toString()))
                                          .toList());
                                      // if (kDebugMode) {
                                      //   print(result);
                                      // }
                                      var sum = sumTotalPrice(result);
                                      if (kDebugMode) {
                                        print('finally sum $sum');
                                      }
                                      return Text(
                                        snapshot.hasData
                                            ? "$sum"
                                            : '0',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.sp),
                                      );
                                    },

                                  ),
                                ),
                              ),
                              Text(
                                "المبلغ المطلوب",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17.sp),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 20,)
                        InkWell(
                          onTap: () async {
                            var response = await MyFatoorah.startPayment(
                              context: context,
                              request: MyfatoorahRequest.test(
                                  currencyIso: Country.SaudiArabia,
                                  successUrl:
                                      'https://momentumacademy.net/wp-content/uploads/2020/05/Paymentsuccessful21.png',
                                  //'https://www.facebook.com',
                                  errorUrl: 'https://www.google.com/',
                                  invoiceAmount: 100,
                                  language: ApiLanguage.English,
                                  //token from api token in site myfatoraa https://myfatoorah.readme.io/docs/demo-information
                                  token:
                                      'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL'),
                            );
                            log(response.paymentId.toString());
                            //فى حاله الدفع
                            log(response.status.toString());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, right: 20, left: 20),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(
                                ' المتابعة للدفع',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void deleteCartItem(id) {
    FirebaseFirestore.instance.collection('cart').doc(id).delete();
    Fluttertoast.showToast(msg: "Item is Deleted");
  }

  double sumTotalPrice(List<double> result) {
    //  num sumTotalPrice=0;
    double sum = 0;
    for (int i = 0; i<result.length; i++ ) {
      sum += result[i];
      // sumTotalPrice+=e;
    }
    if (kDebugMode) {
      print('sum $sum');
    }
    if (kDebugMode) {
      print("========================");
    }
    if (kDebugMode) {
      print('result $result');
    }
    return sum;
    // for(int i=0;i<total.length;i++){
    //   sumTotalPrice +=total[i];
    //   //sumTotalPrice=(sumTotalPrice!+( snapshot.data!.docs[index]['totalPrice'])) as int?;
    // }
    // final sum = total.sum;
    // return sumTotalPrice;
    // if (kDebugMode) {
    //   print (sumTotalPrice);
  }
}
