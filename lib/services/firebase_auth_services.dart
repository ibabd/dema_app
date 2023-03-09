// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dema_app/view/screen2/main_screen.dart';
import 'package:flutter_dema_app/view/screen2/sign_in_user.dart';
import 'package:flutter_dema_app/view/screens/dashboard_screen.dart';
import 'package:flutter_dema_app/view/screens/home_page_admin.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthService {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController numberPhoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login text editing controllers
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  // final String loginEmailAdminController="admin@gmail.com";
  // final String loginPasswordAdminController="admin123";
  // final TextEditingController loginEmailAdminController = TextEditingController();
  // final TextEditingController loginPasswordAdminController = TextEditingController();
  final TextEditingController adminEmailController =
  TextEditingController.fromValue(const TextEditingValue(text: "admin@gmail.com"));
  final TextEditingController adminPasswordController =
  TextEditingController.fromValue(const TextEditingValue(text: "admin123"));
  final TextEditingController confirmAdminPasswordController =
  TextEditingController.fromValue(const TextEditingValue(text: "admin123"));
  final fireStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isAdmin=false;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  User? get userProfile=>auth.currentUser;

  bool get mounted => true;

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    googleSignIn.signOut();
    await auth.signOut();
    prefs.clear();
    Get.offAll(const SignInUser());
  }

/*
  Future loginUser(BuildContext context) async {
    try{
      showDialog(
        context: context,
        //barrierDismissible: barrierDismissible,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext){
          return const AlertDialog(
            title:Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
      await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
      ).then((value){
        if (kDebugMode) {
          print('User is logged in successfully');
        }
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomeScreen()), (route) => false);
      });
    }catch(e){
     Navigator.pop(context);
     showDialog(
         context: context,
         builder: (context){
           return AlertDialog(
             title: const Text("Error Message"),
             content: Text(e.toString()),
           );
         }
     );
    }
    //await auth.signInWithEmailAndPassword(email: email, password: password);
  }
  */



  Future<void> loginUser(BuildContext context) async {
    final UserCredential user = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text);
    if (user != null) {
      // lets save user with shared prefrences

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userID", user.user!.uid);
      if (kDebugMode) {
        print(user.user!.uid);
      }
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainScreen()), (route) => false);
      //Get.to(const HomeScreen());
    } else {
      if (kDebugMode) {
        print('error');
      }
    }
  }


  //SIGN IN METHOD
  // Future signInAdmin({ String email="admin@gmail.com", String password="admin123"}) async {
  //   try {
  //     await auth.signInWithEmailAndPassword(email: email, password: password);
  //     return null;
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }

  Future<void> loginAdmin(BuildContext context) async {
    final user = await auth.signInWithEmailAndPassword(
        email:adminEmailController.text,
        password: adminPasswordController.text);
    if (user != null) {
      // lets save user with shared prefrences

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userID", user.user!.uid).then((value) =>  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const DashboardScreen()), (route) => false)
      );
      if (kDebugMode) {
        print(user.user!.uid);
      }
     // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const DashboardScreen()), (route) => false);
     // Get.to(const HomeScreen());
    } else {
      if (kDebugMode) {
        print('error');
      }
    }
  }


/*
  Future loginAdmin(BuildContext context) async {
   await auth.signInWithEmailAndPassword(email: adminEmails, password: adminPasswords).then((value){
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const DashboardScreen()), (route) => false);
   });
   // then((value) {
   //    fireStore.collection("admin").doc("adminLogin").snapshots().forEach((element) {
   //     if(element.data()!["adminEmail"]==adminEmailController.text && element.data()!["adminPassword"]==adminPasswordController.text){
   //       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const DashboardScreen()), (route) => false);
   //     }
   //   }).catchError((e){
   //     showDialog(
   //         context: context,
   //         builder: (context){
   //           return AlertDialog(
   //             title: const Text('Error Message'),
   //             content: Text(e.toString()),
   //           );
   //         }
   //     );
   //   });
   // });
  }
 */
  Future<void> createAccount(BuildContext context) async {
    // final TextEditingController _usernameController = TextEditingController();
    // final TextEditingController _numberPhoneController = TextEditingController();
    final user = await auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    //final firestore = FirebaseFirestore.instance;
    fireStore.collection('users').doc(user.user!.uid).set(
        {
          "email": emailController.text,
          "password": passwordController.text,
          "userName":usernameController.text,
          "phoneNumber":numberPhoneController.text,
        });
    if (user != null) {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainScreen()), (route) => false);

     // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainScreen()), (route) => false);
    //  Get.to(const HomePageAdmin());
    } else {
      if (kDebugMode) {
        print('error');
      }
    }
  }
  Future<void> createAccountAdmin(BuildContext context) async {
    final user = await auth.createUserWithEmailAndPassword(
        email: adminEmailController.text, password: adminPasswordController.text);
    //final firestore = FirebaseFirestore.instance;
    fireStore.collection('admin').doc(user.user!.uid).set(
        {"email": adminEmailController.text, "password": adminPasswordController.text});
    if (user != null) {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const DashboardScreen()), (route) => false);
      Get.to(const HomePageAdmin());
    } else {
      if (kDebugMode) {
        print('error');
      }
    }
  }
  // Future signup(String email, String password) async {
  //   await auth
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((value) {
  //     fireStore.collection("user").add({
  //       "email": email.toString(),
  //       "password": password.toString(),
  //       "uid": auth.currentUser!.uid,
  //     });
  //   });
  // }
  /*
  Future signUpAdmin(String adminEmail, String adminPassword) async {
    await auth
        .createUserWithEmailAndPassword(email: adminEmail, password: adminPassword)
        .then((value) {
      fireStore.collection("admin").add({
        "email":adminEmails,
        "password": adminPasswords,
        "uid": auth.currentUser!.uid,
      });
    });
  }
   */

  Future<void> signInWithGoogle() async {
   final GoogleSignInAccount? account = await googleSignIn.signIn();
   if(account !=null){
     GoogleSignInAuthentication authentication = await account.authentication;
     final AuthCredential credential=GoogleAuthProvider.credential(
       idToken: authentication.idToken,
       accessToken: authentication.accessToken,
     );
     await auth.signInWithCredential(credential);
     User user= auth.currentUser!;
     if (kDebugMode) {
       print(user.uid);
     }
   }

    // displayName=account.displayName!;
    // displayUserPhoto=account.photoUrl!;
    // displayUserEmail=account.email;
   //  final AuthCredential credential = GoogleAuthProvider.credential(
   //      idToken: authentication.idToken,
   //      accessToken: authentication.accessToken);
   // await auth.signInWithCredential(credential);
   // if(user !=null){
   //   if (kDebugMode) {
   //     print("${user.email}");
   //   }
   }


  }

