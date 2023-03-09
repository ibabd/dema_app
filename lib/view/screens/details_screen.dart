import 'dart:developer';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dema_app/provider/cart.dart';
import 'package:flutter_dema_app/services/database.dart';
import 'package:flutter_dema_app/view/screen2/cart_screen30.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_fatoorah/my_fatoorah.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsScreen extends StatefulWidget {
  final String id,
      image,
      nameProject,
      description,
      nameCharity,
      addressCharity,
      benefitsPeople,
      emailCharity;

  // final int id;
  const DetailsScreen({Key? key,
    required this.id,
    required this.nameProject,
    required this.image,
    required this.nameCharity,
    required this.addressCharity,
    required this.description,
    required this.benefitsPeople,
    required this.emailCharity})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController controller = TextEditingController();
  bool showSpinner = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection("users-cart-items");
  num quantity = 1;
  DbHelper? dbHelper = DbHelper();

  late SharedPreferences prefs;

  // void add() {
  //   setState(() {
  //     quantity++;
  //   });
  // }
  //
  // void subtract() {
  //   setState(() {
  //     quantity--;
  //   });
  // }
  Future addToCart()async{
   // final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      'pId': widget.id,
      'pImage': widget.image.toString(),
      // 'pTime': date.toString(),
      'pNameProject': widget.nameProject.toString(),
      'pDescriptionProject': widget.description.toString(),
      'pNameCharity': widget.nameCharity.toString(),
      'pAddressCharity': widget.addressCharity.toString(),
      'pEmailCharity': widget.emailCharity.toString(),
      'pBenefits': widget.benefitsPeople.toString(),
      'price': controller.text.toString(),
      'quantity': quantity,
      'totalPrice': int.parse(controller.text) * quantity,
    }).
    then((value) {
      toastMethod('item add');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const CartScreen()));
    }).onError((error, stackTrace) {
      toastMethod(error.toString());
      setState(() {
        showSpinner = false;
      });
    });

    //     .then((value){
    //   if (kDebugMode) {
    //     print("Added to cart");
    //   }
    // });
  }
 
  @override
  void initState() {
    // TODO: implement initState
    //read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12)),
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.fill,
                          height: 190.h,
                          width: double.infinity,
                          placeholder: 'assets/images/loading.gif',
                          image: widget.image
                        //.['pImage']!
                      ),
                    ),
                     SizedBox(
                      height: 12.h,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          widget.nameProject,
                          style:  TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                     SizedBox(
                      height: 12.h,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: Text(
                          widget.description,
                          style:  TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: 30.h,
              ),
              Container(
                padding: const EdgeInsets.only(top: 40),
                height: 300.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "معلومات عن المشروع",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                       SizedBox(
                        height: 17.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "المستفادين",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    widget.benefitsPeople,
                                    style:  TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black54),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "نوع المشروع",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                              ),
                               SizedBox(
                                height: 17.h,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(

                                    widget.nameProject,
                                    style:  TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black54),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                       SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                               Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "موقع المشروع",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                              ),
                               SizedBox(
                                height: 17.h,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    widget.addressCharity,
                                    style:  TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black54),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children:[
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "تكلفة المشروع",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 17.h,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:const EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Text(
                                    "2000",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black26),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Badge(
                        badgeColor: Colors.black87,
                        position: BadgePosition.topEnd(top: 10, end: 14),
                        badgeContent: Consumer<Cart>(
                          builder: (context, cartInstance, child) {
                            return const Text(
                              "+",
                              //cartInstance.getCounter().toString(),
                              style: TextStyle(color: Colors.white),
                            );
                          },
                        ),
                        child: IconButton(
                            onPressed: () {
                              _modalBottomSheetMenuCart();
                            },
                            icon: const Icon(
                              // Icons.shopping_cart,
                              Icons.shopping_cart,
                              color: Colors.green,
                              size: 35,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _modalBottomSheetMenuCart1();
                      },
                      child: Container(
                        height: 70.h,
                        width: 230.w,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:  Center(
                          child: Text(
                            "تبرع الآن",
                            style: TextStyle(color: Colors.white, fontSize: 17.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
/*
  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (builder) {
          return Container(
            height: 350.0.h,
            color: Colors.transparent,
            //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 30.0, right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.clear,
                            size: 30,
                            color: Colors.black54,
                          ),
                        ),
                         Text(
                          "تبرع الآن",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 30.0, right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "مدة التبرع",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "قيمة التبرع اليومي",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 30.0, right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50.0.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    if(quantity>1){
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 54.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                    ),
                                  )
                              ),
                              Container(
                                width: 54.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "$quantity",
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: Container(
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          height: 50.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: 50.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(fontSize: 17),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(15),
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'من فضلك ادخل قيمه التبرع';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 30.0, right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50.0.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    if(quantity>1){
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 54.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                    ),
                                  )
                              ),
                              Container(
                                width: 54.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "$quantity",
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: Container(
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          height: 50.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: 50.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(fontSize: 17),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(15),
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'من فضلك ادخل قيمه التبرع';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50.0.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    if(quantity>1){
                                      setState(() {
                                        quantity--;
                                      });
                                    }

                                  },
                                  child: Container(
                                    width: 54.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                    ),
                                  )
                              ),
                              Container(
                                width: 54.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "$quantity",
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: Container(
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        /*
                        Container(
                          height: 50.0.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      quantity--;
                                    });
                                  },
                                  child: Container(
                                    width: 54.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                    ),
                                  )),
                              Container(
                                width: 54.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "$quantity",
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                    });

                                  },
                                  child: Container(
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        */
                        Container(
                          height: 50.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Expanded(
                            child: Container(
                              height: 50.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextFormField(
                                controller: controller,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                decoration:  InputDecoration(
                                  hintStyle: TextStyle(fontSize: 17.sp),
                                  border: InputBorder.none,
                                  contentPadding:const EdgeInsets.all(15),
                                ),
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'من فضلك ادخل قيمه التبرع';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    */

                  ),

                   */
                   SizedBox(
                    height: 40.h,
                  ),
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
                    child: Container(
                      height: 70.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:  Center(
                        child: Text(
                          "المتابعة للدفع",
                          style: TextStyle(color: Colors.white, fontSize: 17.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

 */
  _modalBottomSheetMenuCart1() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (builder) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: 350.0.h,
                color: Colors.transparent,
                //could change this to Color(0xFF737373),
                //so you don't have to change MaterialApp canvasColor
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 30.0, right: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  size: 30,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                "تبرع الآن",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 30.0, right: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "مدة التبرع",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "قيمة التبرع اليومي",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 30.0, right: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50.0.h,
                                width: 160.w,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          if(quantity>1){
                                            setState(() {
                                              quantity--;
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: 54.w,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.green),
                                            color: Colors.white,
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.green,
                                          ),
                                        )
                                    ),
                                    Container(
                                      width: 54.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.green),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "$quantity",
                                          style: const TextStyle(color: Colors.green),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                        child: Container(
                                          width: 50.w,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.green),
                                            color: Colors.white,
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.green,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                  height: 50.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextFormField(
                                    controller: controller,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(
                                        RegExp(r'^0+'),
                                      ),
                                    ],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.right,
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(fontSize: 17),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(15),
                                    ),
                                    validator: (value) {
                                      if(value!.isEmpty&&value==0){
                                        return 'من فضلك ادخل قيمه التبرع';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
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
                          child: Container(
                            height: 70.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:  Center(
                              child: Text(
                                "المتابعة للدفع",
                                style: TextStyle(color: Colors.white, fontSize: 17.sp),
                              ),
                            ),
                          ),
                        ),
                        /*
                     InkWell(
                      onTap: ()async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final User? user = _auth.currentUser;
                          CollectionReference dataReference = FirebaseFirestore
                              .instance.collection('cart');
                          dataReference.doc(widget.id).set({
                            'pId': "${widget.id}1",
                            'pImage': widget.image.toString(),
                            // 'pTime': date.toString(),
                            'pNameProject': widget.nameProject.toString(),
                            'pDescriptionProject':
                            widget.description.toString(),
                            'pNameCharity': widget.nameCharity.toString(),
                            'pAddressCharity': widget.addressCharity.toString(),
                            'pEmailCharity': widget.emailCharity.toString(),
                            'pBenefits': widget.benefitsPeople.toString(),
                            'price':controller.text.toString(),
                            'quantity':quantity,
                            'totalPrice':int.parse(controller.text)*quantity ,
                            // 'uEmail': user!.email.toString(),
                            'uId': user!.uid.toString(),
                          }, SetOptions(merge: true)
                          ).then((value) {
                            toastMethod('item add');
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen()));
                          }).onError((error, stackTrace) {
                            toastMethod(error.toString());
                            setState(() {
                              showSpinner = false;
                            });
                          });
                        } catch (e) {
                          setState(() {
                            showSpinner = false;
                          });
                          toastMethod(e.toString());
                        }
                      },
                      child: Container(
                    height: 70.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(14, 19, 49, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:Center(
                      child: Text(
                        "إضافة",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),

                      */
                        // Consumer<Cart>(builder: (context, cartInstance, child) {
                        //   return InkWell(
                        //     onTap: () {
                        //       dbHelper!
                        //           .insertCart(
                        //         CartModel(
                        //           id:int.parse( widget.id),
                        //           productId: widget.id.toString(),
                        //           productName: widget.nameProject,
                        //           quantity: quantity,
                        //           image:
                        //           widget.image,
                        //           price: int.parse(controller.text),
                        //           totalPrice: int.parse(controller.text*quantity),
                        //         ),
                        //       )
                        //           .then((value) {
                        //         if (kDebugMode) {
                        //           print('product is added to cart');
                        //           print (quantity);
                        //           print()
                        //         }
                        //         //cart.addTotalPrice(double.parse( productPrice[index].toString()));
                        //         cartInstance.addCounter();
                        //         Navigator.push(context, MaterialPageRoute(builder: (context)=> CartItemScreen(cartModel: CartModel(
                        //           productName: widget.nameProject,
                        //           price: int.parse(controller.text),
                        //           totalPrice: int.parse(controller.text*quantity),
                        //           image:  widget.image,
                        //           quantity: quantity,
                        //           productId:widget.id.toString(),
                        //           id: int.parse( widget.id),
                        //         ),
                        //           // quantity: quantity,
                        //           // price:int.parse(controller.text.toString()),
                        //         )));
                        //       }).onError((dynamic error, dynamic stackTrace) {
                        //         if (kDebugMode) {
                        //           print(error.toString());
                        //         }
                        //       });
                        //       // cartInstance.add(snapshot.data!.docs[index]);
                        //
                        //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartItemScreen()));
                        //     },
                        //     child: Container(
                        //       height: 70,
                        //       width: 350,
                        //       decoration: BoxDecoration(
                        //         color: const Color.fromRGBO(14, 19, 49, 1),
                        //         borderRadius: BorderRadius.circular(12),
                        //       ),
                        //       child: const Center(
                        //         child: Text(
                        //           "إضافة",
                        //           style: TextStyle(color: Colors.white, fontSize: 18),
                        //         ),
                        //       ),
                        //     ),
                        //   );
                        /*
                      IconButton(
                      onPressed: () {
                        dbHelper!.insertCart(CartModel(
                          id: index,
                          productId: index.toString(),
                          productName: snapshot.data!.docs[index]["pNameProject"].toString(),
                          // productPrice: productPrice[index],
                          // initialPrice: productPrice[index],
                          quantity: 1,
                          // unitTag: productUnit[index].toString(),
                          image:snapshot.data!.docs[index]["pImage"].toString(),
                        ),
                        ).then((value) {
                          if (kDebugMode) {
                            print('product is added to cart');
                          }
                          //cart.addTotalPrice(double.parse( productPrice[index].toString()));
                          cart.addCounter();
                        }).onError((dynamic error,dynamic stackTrace){
                          if (kDebugMode) {
                            print(error.toString());
                          }
                        });
                        // cartInstance.add(snapshot.data!.docs[index]);
                      },
                      icon: const Icon(
                        // Icons.shopping_cart,
                        Icons.shopping_cart,
                        color: Colors.black,
                        size: 35,
                      ),
                    );
                    */
                      ] ),
                ),
              );
            });},
    );
  }
   _modalBottomSheetMenuCart() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (builder) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  height: 350.0.h,
                  color: Colors.transparent,
                  //could change this to Color(0xFF737373),
                  //so you don't have to change MaterialApp canvasColor
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                        children: [
                    Padding(
                    padding:
                    const EdgeInsets.only(top: 30.0, right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.clear,
                            size: 30,
                            color: Colors.black54,
                          ),
                        ),
                         Text(
                          "إضافة للسلة",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 30.0, right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "مدة التبرع",
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "قيمة التبرع اليومي",
                          style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 30.0, right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50.0.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    if(quantity>1){
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                    },
                                  child: Container(
                                    width: 54.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.green,
                                    ),
                                  )
                              ),
                              Container(
                                width: 54.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "$quantity",
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: Container(
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          height: 50.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: 50.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: controller,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                  RegExp(r'^0+'),
                                ),
                              ],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(fontSize: 17),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(15),
                              ),
                              validator: (value) {
                                if(value!.isEmpty&&value==0){
                                  return 'من فضلك ادخل قيمه التبرع';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                     SizedBox(
                    height: 40.h,
                  ),
                          InkWell(
                            onTap: (){
                              addToCart();
                            },
                            child: Container(
                              height: 70.h,
                              width: 350.w,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(14, 19, 49, 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child:Center(
                                child: Text(
                                  "إضافة",
                                  style: TextStyle(color: Colors.white, fontSize: 17.sp),
                                ),
                              ),
                            ),
                          ),
                     /*
                     InkWell(
                      onTap: ()async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final User? user = _auth.currentUser;
                          CollectionReference dataReference = FirebaseFirestore
                              .instance.collection('cart');
                          dataReference.doc(widget.id).set({
                            'pId': "${widget.id}1",
                            'pImage': widget.image.toString(),
                            // 'pTime': date.toString(),
                            'pNameProject': widget.nameProject.toString(),
                            'pDescriptionProject':
                            widget.description.toString(),
                            'pNameCharity': widget.nameCharity.toString(),
                            'pAddressCharity': widget.addressCharity.toString(),
                            'pEmailCharity': widget.emailCharity.toString(),
                            'pBenefits': widget.benefitsPeople.toString(),
                            'price':controller.text.toString(),
                            'quantity':quantity,
                            'totalPrice':int.parse(controller.text)*quantity ,
                            // 'uEmail': user!.email.toString(),
                            'uId': user!.uid.toString(),
                          }, SetOptions(merge: true)
                          ).then((value) {
                            toastMethod('item add');
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen()));
                          }).onError((error, stackTrace) {
                            toastMethod(error.toString());
                            setState(() {
                              showSpinner = false;
                            });
                          });
                        } catch (e) {
                          setState(() {
                            showSpinner = false;
                          });
                          toastMethod(e.toString());
                        }
                      },
                      child: Container(
                    height: 70.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(14, 19, 49, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:Center(
                      child: Text(
                        "إضافة",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),

                      */
                // Consumer<Cart>(builder: (context, cartInstance, child) {
                //   return InkWell(
                //     onTap: () {
                //       dbHelper!
                //           .insertCart(
                //         CartModel(
                //           id:int.parse( widget.id),
                //           productId: widget.id.toString(),
                //           productName: widget.nameProject,
                //           quantity: quantity,
                //           image:
                //           widget.image,
                //           price: int.parse(controller.text),
                //           totalPrice: int.parse(controller.text*quantity),
                //         ),
                //       )
                //           .then((value) {
                //         if (kDebugMode) {
                //           print('product is added to cart');
                //           print (quantity);
                //           print()
                //         }
                //         //cart.addTotalPrice(double.parse( productPrice[index].toString()));
                //         cartInstance.addCounter();
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=> CartItemScreen(cartModel: CartModel(
                //           productName: widget.nameProject,
                //           price: int.parse(controller.text),
                //           totalPrice: int.parse(controller.text*quantity),
                //           image:  widget.image,
                //           quantity: quantity,
                //           productId:widget.id.toString(),
                //           id: int.parse( widget.id),
                //         ),
                //           // quantity: quantity,
                //           // price:int.parse(controller.text.toString()),
                //         )));
                //       }).onError((dynamic error, dynamic stackTrace) {
                //         if (kDebugMode) {
                //           print(error.toString());
                //         }
                //       });
                //       // cartInstance.add(snapshot.data!.docs[index]);
                //
                //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartItemScreen()));
                //     },
                //     child: Container(
                //       height: 70,
                //       width: 350,
                //       decoration: BoxDecoration(
                //         color: const Color.fromRGBO(14, 19, 49, 1),
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //       child: const Center(
                //         child: Text(
                //           "إضافة",
                //           style: TextStyle(color: Colors.white, fontSize: 18),
                //         ),
                //       ),
                //     ),
                //   );
                /*
                      IconButton(
                      onPressed: () {
                        dbHelper!.insertCart(CartModel(
                          id: index,
                          productId: index.toString(),
                          productName: snapshot.data!.docs[index]["pNameProject"].toString(),
                          // productPrice: productPrice[index],
                          // initialPrice: productPrice[index],
                          quantity: 1,
                          // unitTag: productUnit[index].toString(),
                          image:snapshot.data!.docs[index]["pImage"].toString(),
                        ),
                        ).then((value) {
                          if (kDebugMode) {
                            print('product is added to cart');
                          }
                          //cart.addTotalPrice(double.parse( productPrice[index].toString()));
                          cart.addCounter();
                        }).onError((dynamic error,dynamic stackTrace){
                          if (kDebugMode) {
                            print(error.toString());
                          }
                        });
                        // cartInstance.add(snapshot.data!.docs[index]);
                      },
                      icon: const Icon(
                        // Icons.shopping_cart,
                        Icons.shopping_cart,
                        color: Colors.black,
                        size: 35,
                      ),
                    );
                    */
             ] ),
                  ),
          );
        });},
    );
  }
}
void toastMethod(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black45,
      fontSize: 16.0);
}
/*
  Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.fill,
                            height: 300,
                            width: double.infinity,
                            placeholder: 'assets/images/loading.gif',
                            image: widget.image
                            //.['pImage']!
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            widget.nameProject,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only( right:10),
                          child: Text(
                            widget.description,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "   اسم الجمعيه  :${widget.nameCharity}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "  عنوان الجمعيه  :${widget.addressCharity}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "  ${widget.emailCharity}    :  البريد الاكترونى",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "  المستفادون  :   ${widget.benefitsPeople}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
 */
