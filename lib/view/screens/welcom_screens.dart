// import 'package:flutter/material.dart';
// import 'package:flutter_dema_app/view/screen2/sign_in_user.dart';
// import 'package:flutter_dema_app/view/screen2/sign_up_user.dart';
// import 'package:flutter_dema_app/view/widgets/custom_button.dart';
//
// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//             image: DecorationImage(image: AssetImage("assets/images/background_image1.png"))),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             const SizedBox(
//               height: 130,
//               width: 180,
//               child: Image(
//                   image: AssetImage("assets/images/donate2.png"), fit: BoxFit.cover),
//             ),
//             const SizedBox(height: 40),
//             CustomizedButton(
//               buttonText: "Login",
//               buttonColor: Colors.white,
//               textColor: Colors.black,
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (_) => const SignInUser()));
//
//                 // Navigator.push(context,
//                 //     MaterialPageRoute(builder: (_) => const LoginScreen()));
//               },
//             ),
//             CustomizedButton(
//               buttonText: "Register",
//               buttonColor: Colors.white,
//               textColor: Colors.black,
//               onPressed: () {
//                 // Navigator.push(context,
//                 //     MaterialPageRoute(builder: (_) => const SignUpScreen()));
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (_) => const SignUpUser()));
//               },
//             ),
//             const SizedBox(height: 20),
//             const Padding(
//               padding:  EdgeInsets.all(10.0),
//               child: Text(
//                 "Continue as a Guest",
//                 style: TextStyle(color: Color(0xff35C2C1), fontSize: 25),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }