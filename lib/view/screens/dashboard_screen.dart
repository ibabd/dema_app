import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dema_app/services/firebase_auth_services.dart';
import 'package:flutter_dema_app/view/screen2/sign_in_user.dart';
import 'package:flutter_dema_app/view/screens/add_data_screen.dart';
import 'package:flutter_dema_app/view/screens/home_page_admin.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}


class _DashboardScreenState extends State<DashboardScreen> {
  final fireStore = FirebaseFirestore.instance;
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final String? email = FirebaseAuth.instance.currentUser!.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        automaticallyImplyLeading:false,
        title:const Text('لوحه التحكم',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async{
              await FirebaseAuth.instance.signOut();
              if (!mounted) return;
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  const SignInUser();
              }));
            },
            icon: const Icon(Icons.logout,color: Colors.black54,size: 24,),
          ),
        ],
      ),
        drawer:  Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white38
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      child:Image.asset('assets/images/phone_charity.png'),
                    ),
                    Text(
                      email!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                    Icons.home,
                    color: Colors.black
                ),
                title: const Text('الصفحه الرئيسيه',style: TextStyle(color: Colors.black),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                    Icons.settings,
                    color: Colors.black
                ),
                title: const Text('الاعدادات',style: TextStyle(color: Colors.black),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.language_outlined,
                  color: Colors.black,
                ),
                title: const Text('اللغه',style: TextStyle(color: Colors.black),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: const Text('تسجيل الخروج',style: TextStyle(color: Colors.black),),
                onTap: () async{
                  await FirebaseAuth.instance.signOut();
                  if (!mounted) return;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  const SignInUser();
                  }));
                },
              ),
            ],
          ),
        ),
        // drawer: Drawer(
        //   child: ListView(
        //     // Important: Remove any padding from the ListView.
        //     padding: EdgeInsets.zero,
        //     children: [
        //       Container(
        //         decoration: const BoxDecoration(
        //           color: Colors.white38
        //         ),
        //         child: Column(
        //           children: [
        //             CircleAvatar(
        //               child:Image.asset('assets/images/phone_charity.png'),
        //             ),
        //              Text(
        //               email!,
        //               style: const TextStyle(
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       ListTile(
        //         leading: const Icon(
        //             Icons.home,
        //             color: Colors.black
        //         ),
        //         title: const Text('الصفحه الرئيسيه',style: TextStyle(color: Colors.black),),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: const Icon(
        //             Icons.settings,
        //             color: Colors.black
        //         ),
        //         title: const Text('الاعدادات',style: TextStyle(color: Colors.black),),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: const Icon(
        //           Icons.language_outlined,
        //           color: Colors.black,
        //         ),
        //         title: const Text('اللغه',style: TextStyle(color: Colors.black),),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: const Icon(
        //           Icons.logout,
        //           color: Colors.black,
        //         ),
        //         title: const Text('تسجيل الخروج',style: TextStyle(color: Colors.black),),
        //         onTap: () async{
        //           await FirebaseAuth.instance.signOut();
        //           if (!mounted) return;
        //           Navigator.push(context, MaterialPageRoute(builder: (context) {
        //             return  const WelcomeScreen();
        //           }));
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddData()));

                    },
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:  BorderRadius.only(bottomLeft:Radius.circular(25),bottomRight:Radius.circular(25),topLeft:Radius.circular(25) ),
                      ),
                      child: const Center(child: Text('أضافة قسم',style:TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePageAdmin()));
                    },
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:  BorderRadius.only(bottomLeft:Radius.circular(25),bottomRight:Radius.circular(25),topRight:Radius.circular(25) ),
                      ),
                      child: const Center(child: Text('الاقسام',style:TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
