// import 'package:flutter/material.dart';
// import 'package:flutter_dema_app/services/firebase_auth_services.dart';
// import 'package:flutter_dema_app/view/screens/admin_login.dart';
// import 'package:flutter_dema_app/view/widgets/custom_button.dart';
//
//
// class AdminRegisterScreen extends StatefulWidget {
//   const AdminRegisterScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AdminRegisterScreen> createState() => _AdminRegisterScreenState();
// }
//
// class _AdminRegisterScreenState extends State<AdminRegisterScreen> {
//   FirebaseAuthService firebaseAuthService=FirebaseAuthService();
//   final _formKey=GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body:
//           SingleChildScrollView(
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height,
//               width: double.infinity,
//               child: Form(
//               key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Container(
//                         height: 50,
//                         width: 50,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black, width: 1),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: IconButton(
//                             icon: const Icon(Icons.arrow_back_ios_sharp),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             }),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: Text("Hello!  Register to get \nStarted",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                           )),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: TextFormField(
//                         controller: firebaseAuthService.adminEmailController,
//                         decoration: InputDecoration(
//                           prefixIcon:
//                           IconButton(
//                             icon: const Icon(Icons.email, color: Colors.grey),
//                             onPressed: () {},
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
//                               borderRadius: BorderRadius.circular(10)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
//                               borderRadius: BorderRadius.circular(10)),
//                           fillColor: const Color(0xffE8ECF4),
//                           filled: true,
//                           hintText: "Enter admin email",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         onChanged: (String value){
//                           firebaseAuthService.adminEmailController.text=value;
//                         },
//                         validator: (value){
//                           return value!.isEmpty ?'enter email':null ;
//                         },
//
//                       ),
//                     ),
//                     const SizedBox(height: 15,),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: TextFormField(
//                         controller: firebaseAuthService.adminPasswordController,
//                         obscureText:true,
//                         decoration: InputDecoration(
//                           prefixIcon:
//                           IconButton(
//                             icon: const Icon(Icons.lock, color: Colors.grey),
//                             onPressed: () {},
//                           ),
//
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
//                               borderRadius: BorderRadius.circular(10)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
//                               borderRadius: BorderRadius.circular(10)),
//                           fillColor: const Color(0xffE8ECF4),
//                           filled: true,
//                           hintText: "Enter admin password",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         onChanged: (String value){
//                           value=firebaseAuthService.adminPasswordController.text;
//                         },
//                         validator: (value){
//                           return value!.isEmpty ?'enter password':null ;
//                         },
//                       ),
//                     ),
//                     const SizedBox(height: 15,),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: TextFormField(
//                         controller: firebaseAuthService.confirmAdminPasswordController,
//                         obscureText:true,
//                         decoration: InputDecoration(
//                           prefixIcon:
//                           IconButton(
//                             icon: const Icon(Icons.lock, color: Colors.grey),
//                             onPressed: () {},
//                           ),
//
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
//                               borderRadius: BorderRadius.circular(10)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
//                               borderRadius: BorderRadius.circular(10)),
//                           fillColor: const Color(0xffE8ECF4),
//                           filled: true,
//                           hintText: "confirm admin password",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         onChanged: (String value){
//                           firebaseAuthService.confirmAdminPasswordController.text=value;
//                         },
//                         validator: (value){
//                           return value!.isEmpty ?'enter password':null ;
//                         },
//                       ),
//                     ),
//                     CustomizedButton(
//                       buttonText: "Register",
//                       buttonColor: Colors.black,
//                       textColor: Colors.white,
//                       onPressed: () async {
//                         await firebaseAuthService.createAccountAdmin(context);
//                       },
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Row(
//                         children: [
//                           Container(
//                             height: 1,
//                             width: MediaQuery.of(context).size.height * 0.18,
//                             color: Colors.grey,
//                           ),
//                           const Text("Or Register with"),
//                           Container(
//                             height: 1,
//                             width: MediaQuery.of(context).size.height * 0.15,
//                             color: Colors.grey,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(48, 8, 8, 8.0),
//                       child: Row(
//                         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           const Text("Already have an account?",
//                               style: TextStyle(
//                                 color: Color(0xff1E232C),
//                                 fontSize: 15,
//                               )),
//                           InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (_) => const AdminLoginScreen()));
//                             },
//                             child: const Text("  Login Now",
//                                 style: TextStyle(
//                                   color: Color(0xff35C2C1),
//                                   fontSize: 15,
//                                 )),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )),
//
//     );
//   }
// }