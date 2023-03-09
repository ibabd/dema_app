import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dema_app/firebase_options.dart';
import 'package:flutter_dema_app/provider/cart.dart';
import 'package:flutter_dema_app/view/screen2/main_screen.dart';
import 'package:flutter_dema_app/view/screen2/sign_in_user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =  const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
  // Get.put(LoginController());
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);
//  bool isUserLoggedIn = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
      providers: [
        // ChangeNotifierProvider<ModelHud>(
        //   create: (context) => ModelHud(),
        // ),
        // ChangeNotifierProvider<AdminMode>(
        //   create: (context) => AdminMode(),
        // ),
        ChangeNotifierProvider(
          create: (context) {
            return Cart();
          },
        ),
      ],
       child: ScreenUtilInit(
         designSize: const Size(360, 690),
         minTextAdapt: true,
         splitScreenMode: true,
         builder: (BuildContext context, Widget? child) {
           return  MaterialApp(
             debugShowCheckedModeBanner: false,
             title: 'Dema App',
             home: StreamBuilder(
               stream: FirebaseAuth.instance.authStateChanges(),
               builder: (context, snapshot) {
                 if (snapshot.hasData) {
                   return const MainScreen();
                 } else {
                   return const SignInUser();
                 }
               },
             ),
           );
         },
       ),
    );
  }
}
