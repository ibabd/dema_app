// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dema_app/services/firebase_auth_services.dart';
// import 'package:flutter_dema_app/view/screen2/main_screen.dart';
// import 'package:flutter_dema_app/view/screens/admin_register_screen.dart';
// import 'package:flutter_dema_app/view/screens/login.dart';
// import 'package:flutter_dema_app/view/screens/phone_login.dart';
// import 'package:flutter_dema_app/view/widgets/custom_button.dart';
// import 'package:flutter_dema_app/view/widgets/custom_textfield.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   // final TextEditingController _emailController = TextEditingController();
//    final TextEditingController _usernameController = TextEditingController();
//   // final TextEditingController _passwordController = TextEditingController();
//   // final TextEditingController _confirmPasswordController =
//   // TextEditingController();
//   FirebaseAuthService firebaseAuthService=FirebaseAuthService();
//    final _formKey=GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: SingleChildScrollView(
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height,
//               width: double.infinity,
//               child: Form(
//                 key:_formKey ,
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
//                     CustomizedTextField(
//                       myController:_usernameController,
//                       hintText: "Username",
//                       isPassword: false
//                     ),
//                     CustomizedTextField(
//                       myController:firebaseAuthService.emailController,
//                       hintText: "Email",
//                       isPassword: false,
//                     ),
//                     CustomizedTextField(
//                       myController:firebaseAuthService.passwordController,
//                       hintText: "Password",
//                       isPassword: true,
//                     ),
//                     CustomizedButton(
//                       buttonText: "Register",
//                       buttonColor: Colors.black,
//                       textColor: Colors.white,
//                       onPressed: () async {
//                         await firebaseAuthService.createAccount(context);
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
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Container(
//                               height: 50,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.black, width: 1),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: IconButton(
//                                 icon: const Icon(
//                                   FontAwesomeIcons.apple,
//                                   // color: Colors.blue,
//                                 ),
//                                 onPressed: () {},
//                               )),
//                           Container(
//                             height: 50,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.black, width: 1),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: IconButton(
//                               icon: const Icon(
//                                 FontAwesomeIcons.google,
//                                 // color: Colors.blue,
//                               ),
//                               onPressed: () async {
//                                 await FirebaseAuthService().signInWithGoogle();
//                                 // Navigator.push(context,
//                                 //     MaterialPageRoute(builder: (_) => const LoginScreen()));
//
//                                 // await FirebaseAuthService().logininwithgoogle();
//                                 //
//                                 if (FirebaseAuth.instance.currentUser != null) {
//                                   if (!mounted) return;
//
//                                   await Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => const MainScreen()));
//                                 } else {
//                                   throw Exception("Error");
//                                 }
//                               },
//                             ),
//                           ),
//                           Container(
//                               height: 50,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.black, width: 1),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: IconButton(
//                                 icon: const Icon(
//                                   FontAwesomeIcons.phoneFlip,
//                                   color: Colors.blue,
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => PhoneScreen()));
//                                 },
//                               )),
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
//                                       builder: (_) => const LoginScreen()));
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
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                         onPressed: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminRegisterScreen()));
//                         },
//                         child: const Center(
//                           child: Text('Go To Admin Register',style:  TextStyle(
//                             color:  Color(0xff35C2C1),
//                             fontSize: 15,
//                           ),),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
// }
