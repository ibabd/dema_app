// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dema_app/services/firebase_auth_services.dart';
// import 'package:flutter_dema_app/view/screen2/main_screen.dart';
// import 'package:flutter_dema_app/view/screens/admin_login.dart';
// import 'package:flutter_dema_app/view/screens/forget_password.dart';
// import 'package:flutter_dema_app/view/screens/phone_login.dart';
// import 'package:flutter_dema_app/view/screens/sign_up.dart';
// import 'package:flutter_dema_app/view/widgets/custom_button.dart';
// import 'package:flutter_dema_app/view/widgets/custom_textfield.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   // final TextEditingController _emailController = TextEditingController();
//   // final TextEditingController _passwordController = TextEditingController();
//   // final TextEditingController _emailAdminController = TextEditingController();
//   // final TextEditingController _passwordAdminController = TextEditingController();
//   // String emailAdmin ='admin1@edraak.com';
//   //TextEditingController emailAdmin ='admin1@edraak.com';
//   // String adminPassword='admin12345';
//   // bool isAdmin=false;
//
//   FirebaseAuthService firebaseAuthService=FirebaseAuthService();
//   final _formKey=GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity, child: SingleChildScrollView(
//           child: Form(
//             key:_formKey,
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
//
//                 CustomizedTextField(
//                   myController:firebaseAuthService.loginEmailController,
//                   hintText: "Enter your Email",
//                   isPassword: false,
//                 ),
//                 CustomizedTextField(
//                   myController: firebaseAuthService.loginPasswordController,
//                   hintText: "Enter your Password",
//                   isPassword: true,
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const ForgotPassword()));
//                       },
//                       child: const Text("Forgot Password?",
//                           style: TextStyle(
//                             color: Color(0xff6A707C),
//                             fontSize: 15,
//                           )),
//                     ),
//                   ),
//                 ),
//                 CustomizedButton(
//                   buttonText: "Login",
//                   buttonColor: Colors.black,
//                   textColor: Colors.white,
//
//                     onPressed: () async {
//                     if(_formKey.currentState!.validate()){
//                      await firebaseAuthService.loginUser(context);
//                     }else{
//                       if (kDebugMode) {
//                         print("error");
//                       }
//                     }
//
//                   },
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 1,
//                         width: MediaQuery.of(context).size.height * 0.18,
//                         color: Colors.grey,
//                       ),
//                       const Text("Or Login with"),
//                       Container(
//                         height: 1,
//                         width: MediaQuery.of(context).size.height * 0.15,
//                         color: Colors.grey,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                           height: 50,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black, width: 1),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: IconButton(
//                             icon: const Icon(
//                               FontAwesomeIcons.apple,
//                               // color: Colors.blue,
//                             ),
//                             onPressed: () {},
//                           )),
//                       Container(
//                         height: 50,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black, width: 1),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: IconButton(
//                           icon: const Icon(
//                             FontAwesomeIcons.google,
//                             // color: Colors.blue,
//                           ),
//                           onPressed: () async {
//                             await FirebaseAuthService().signInWithGoogle();
//                             // Navigator.push(context,
//                             //     MaterialPageRoute(builder: (_) => const LoginScreen()));
//
//                             // await FirebaseAuthService().logininwithgoogle();
//                             //
//                             if (FirebaseAuth.instance.currentUser != null) {
//                               if (!mounted) return;
//
//                               await Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => const MainScreen()));
//                             } else {
//                               throw Exception("Error");
//                             }
//                           },
//                         ),
//                       ),
//                       Container(
//                           height: 50,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black, width: 1),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: IconButton(
//                             icon: const Icon(
//                               FontAwesomeIcons.phoneFlip,
//                               color: Colors.blue,
//                             ),
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => PhoneScreen()));
//                             },
//                           )),
//
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(60, 8, 8, 8.0),
//                   child: Row(
//                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children:  [
//                       const Center(
//                         child: Text("Don't have an account?",
//                             style: TextStyle(
//                               color: Color(0xff1E232C),
//                               fontSize: 15,
//                             )),
//                       ),
//                       InkWell(
//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
//                         },
//                         child: const Text("  Register Now",
//                             style:  TextStyle(
//                               color:  Color(0xff35C2C1),
//                               fontSize: 15,
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminLoginScreen()));
//                     },
//                     child: const Center(
//                       child: Text('Go To Admin Account',style:  TextStyle(
//                         color:  Color(0xff35C2C1),
//                         fontSize: 15,
//                       ),),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }
//
