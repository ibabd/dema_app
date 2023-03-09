// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_dema_app/utils/constant.dart';
// // import 'package:flutter_dema_app/view/screens/dashboard_screen.dart';
// // import 'package:flutter_dema_app/view/widgets/custom_button.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// // class AdminLogin extends StatefulWidget {
// //   const AdminLogin({Key? key}) : super(key: key);
// //
// //   @override
// //   State<AdminLogin> createState() => _AdminLoginState();
// // }
// //
// // class _AdminLoginState extends State<AdminLogin> {
// //   // final TextEditingController _emailController = TextEditingController();
// //   // final TextEditingController _passwordController = TextEditingController();
// //   final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
// //   String userNameAdmin ='admin';
// //   String adminPassword='admin12345';
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         // appBar: AppBar(
// //         //   backgroundColor: Colors.black26,
// //         //   title: const Text('تسجيل دخول الادمن',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
// //         //   centerTitle: true,
// //         // ),
// //           body: Form(
// //             key: _globalKey,
// //             child: SizedBox(
// //               height: MediaQuery.of(context).size.height,
// //               width: double.infinity,
// //               child: SingleChildScrollView(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Padding(
// //                       padding: const EdgeInsets.all(10.0),
// //                       child: Container(
// //                         height: 50,
// //                         width: 50,
// //                         decoration: BoxDecoration(
// //                           border: Border.all(color: Colors.black, width: 1),
// //                           borderRadius: BorderRadius.circular(10),
// //                         ),
// //                         child: IconButton(
// //                             icon: const Icon(Icons.arrow_back_ios_sharp),
// //                             onPressed: () {
// //                               Navigator.pop(context);
// //                             }),
// //                       ),
// //                     ),
// //                     const Padding(
// //                       padding: EdgeInsets.all(10.0),
// //                       child: Text("Welcome Back! Admin \nto see you again",
// //                           style: TextStyle(
// //                             color: Colors.black,
// //                             fontSize: 30,
// //                             fontWeight: FontWeight.bold,
// //                           )),
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.all(10),
// //                       child: TextFormField(
// //                         validator: (value) {
// //                           if (value!.isEmpty) {
// //                             return 'يرجى أدخال اسم المستخدم';
// //                             // ignore: missing_return
// //                           }
// //                           return null;
// //                         },
// //                         onSaved: (value){
// //                           setState(() {
// //                             value= userNameAdmin;
// //                             // if (kDebugMode) {
// //                             //   print (value);
// //                             // }
// //                           });
// //                         },
// //                         cursorColor: kMainColor,
// //                         decoration: InputDecoration(
// //                           hintText: 'دخل أسم المستخدم',
// //                           prefixIcon: const Icon(
// //                             Icons.person,
// //                             color: Colors.black,
// //                           ),
// //                           filled: true,
// //                           fillColor: kSecondaryColor,
// //                           enabledBorder: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(20),
// //                               borderSide: const BorderSide(color: Colors.white)),
// //                           focusedBorder: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(20),
// //                               borderSide: const BorderSide(color: Colors.white)),
// //                           border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(20),
// //                               borderSide: const BorderSide(color: Colors.white)),
// //                         ),
// //
// //
// //                       ),
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
// //                       child: TextFormField(
// //                         validator: (value) {
// //                           if (value!.isEmpty) {
// //                             return 'يرجى أدخال كلمه المرور';
// //                           }
// //                           return null;
// //                         },
// //                         onSaved: (value){
// //                           setState(() {
// //                             value=adminPassword;
// //                            if (kDebugMode) {
// //                              print (value);
// //                            }
// //                           });
// //                         },
// //                         cursorColor: kMainColor,
// //                         obscureText: true,
// //                         decoration: InputDecoration(
// //                           hintText: 'دخل كلمه المرور',
// //                           prefixIcon: const Icon(
// //                             Icons.lock,
// //                             color: kMainColor,
// //                           ),
// //                           filled: true,
// //                           fillColor: kSecondaryColor,
// //                           enabledBorder: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(20),
// //                               borderSide: const BorderSide(color: Colors.white)),
// //                           focusedBorder: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(20),
// //                               borderSide: const BorderSide(color: Colors.white)),
// //                           border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(20),
// //                               borderSide: const BorderSide(color: Colors.white)),
// //                         ),
// //
// //
// //                       ),
// //                     ),
// //                     CustomizedButton(
// //                       buttonText: "Login",
// //                       buttonColor: Colors.black,
// //                       textColor: Colors.white,
// //                       onPressed: (){
// //                         var formdata=_globalKey.currentState;
// //                         if(formdata!.validate()){
// //                           formdata.save();
// //                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const DashboardScreen()));
// //                         }
// //                         else{
// //                          return toastMethod('error');
// //                         }
// //                         // Navigator.push(context,
// //                         //     MaterialPageRoute(builder: (_) => const LoginScreen()));
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           )),
// //     );
// //   }
// //   void toastMethod(String message){
// //     Fluttertoast.showToast(
// //         msg: message,
// //         toastLength: Toast.LENGTH_SHORT,
// //         gravity: ToastGravity.SNACKBAR,
// //         timeInSecForIosWeb: 1,
// //         backgroundColor: Colors.white,
// //         textColor: Colors.black45,
// //         fontSize: 16.0
// //     );
// //   }
// // }
// //
// //
// //
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_dema_app/constant.dart';
// // //
// // // class AdminScreen extends StatelessWidget {
// // //   const AdminScreen({Key? key}) : super(key: key);
// // //   static String id='adminScreen';
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: kMainColor,
// // //       body: Column(
// // //         mainAxisAlignment: MainAxisAlignment.center,
// // //         crossAxisAlignment: CrossAxisAlignment.center,
// // //         children:  [
// // //           const SizedBox(
// // //             width:double.infinity ,
// // //           ),
// // //           ElevatedButton(
// // //             onPressed: (){
// // //             //  Navigator.pushNamed(context, AddProduct.id);
// // //             },
// // //             child:const Text('Add Product'),
// // //           ),
// // //           ElevatedButton(
// // //             onPressed: (){},
// // //             child:const Text('Edit Product'),
// // //           ),
// // //           ElevatedButton(
// // //             onPressed: (){},
// // //             child: const Text('View Order'),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_dema_app/services/firebase_auth_services.dart';
// import 'package:flutter_dema_app/view/screens/login.dart';
// import 'package:flutter_dema_app/view/widgets/custom_button.dart';
//
// class AdminLoginScreen extends StatefulWidget {
//   const AdminLoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AdminLoginScreen> createState() => _AdminLoginScreenState();
// }
//
// class _AdminLoginScreenState extends State<AdminLoginScreen> {
//
//   FirebaseAuthService firebaseAuthService=FirebaseAuthService();
//   final _formKey=GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity,
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.black, width: 1),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: IconButton(
//                         icon: const Icon(Icons.arrow_back_ios_sharp),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         }),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(10.0),
//                   child: Text("Welcome Back! Glad \nto see you again",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     controller: firebaseAuthService.adminEmailController,
//                     decoration: InputDecoration(
//                       prefixIcon:
//                            IconButton(
//                         icon: const Icon(Icons.email, color: Colors.grey),
//                         onPressed: () {},
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
//                           borderRadius: BorderRadius.circular(10)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
//                           borderRadius: BorderRadius.circular(10)),
//                       fillColor: const Color(0xffE8ECF4),
//                       filled: true,
//                       hintText: "Enter admin email",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onChanged: (String value){
//                       firebaseAuthService.adminEmailController.text=value;
//                     },
//                     validator: (value){
//                       return value!.isEmpty ?'enter email':null ;
//                     },
//
//                   ),
//                 ),
//                 const SizedBox(height: 15,),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     controller: firebaseAuthService.adminPasswordController,
//                       obscureText:true,
//                     decoration: InputDecoration(
//                       prefixIcon:
//                       IconButton(
//                         icon: const Icon(Icons.lock, color: Colors.grey),
//                         onPressed: () {},
//                       ),
//
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
//                           borderRadius: BorderRadius.circular(10)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
//                           borderRadius: BorderRadius.circular(10)),
//                       fillColor: const Color(0xffE8ECF4),
//                       filled: true,
//                       hintText: "Enter admin password",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onChanged: (String value){
//                       firebaseAuthService.adminPasswordController.text=value;
//                     },
//                     validator: (value){
//                       return value!.isEmpty ?'enter password':null ;
//                     },
//                   ),
//                 ),
//                 CustomizedButton(
//                   buttonText: "Login",
//                   buttonColor: Colors.black,
//                   textColor: Colors.white,
//                   onPressed: () async {
//                     if(_formKey.currentState!.validate()){
//                      await firebaseAuthService.loginAdmin(context);
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 40,),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Do you Login as User ',
//                       style: TextStyle(
//                         color: Colors.black54,
//                         fontSize: 16,
//                       ),
//                     ),
//                     InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const LoginScreen()));
//                         },
//                         child: const Text(
//                           'Click Here'
//                             ,style:  TextStyle(
//                             color:  Color(0xff35C2C1),
//                       fontSize: 15,
//                     ),
//                         ))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }
