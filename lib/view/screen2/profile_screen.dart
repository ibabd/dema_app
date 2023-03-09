import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // late String myEmail;
  // late String myPhone;
  // late String userName;
   String ?myEmail;
   String ?myPhone;
   String ?userName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                    future:_fetch() ,
                    builder: (context,snapshot){
                      if(snapshot.connectionState !=ConnectionState.done){
                        return Center(child: Text(" Loading data ... please wait",style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.black54,
                        ),));
                      }
                      return Column(
                        children: [
                          ListTile(
                            leading:Text(
                              userName==null?"زائر":userName!,
                              style: TextStyle(fontSize: 17.sp,color: Colors.black54),
                            ),
                            trailing:Text("أسم المستخدم",style: TextStyle(fontSize: 17.sp,color: Colors.black54),),
                          ),
                          SizedBox(height: 15.h,),
                          ListTile(
                              leading:Text(
                                myPhone==null?" ":myPhone!
                                ,style: TextStyle(fontSize: 17.sp,color: Colors.black54),),
                              trailing:Text("رقم الهاتف",style: TextStyle(fontSize: 17.sp,color: Colors.black54),),
                          ),
                          SizedBox(height: 15.h,),
                          ListTile(
                              leading:
                              Text(
                                myEmail==null?" ":myEmail!
                                ,style: TextStyle(fontSize: 17.sp,color: Colors.black54),),
                              trailing:Text("البريد الكتروني",style: TextStyle(fontSize: 17.sp,color: Colors.black54),),
                          ),
                        ],
                      );

                    }
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  _fetch()async{
    final firebaseUser= FirebaseAuth.instance.currentUser!;
    if(firebaseUser!=null){
      await FirebaseFirestore.instance.collection("users").doc(firebaseUser.uid).get().then((value) {
        userName=value.data()!['userName'];
        myPhone=value.data()!['phoneNumber'];
        myEmail=value.data()!['email'];
        if (kDebugMode) {
          print(userName);
          print(myPhone);
          print(myEmail);
        }
      }).catchError((e){
        if (kDebugMode) {
          print (e);
        }
      });
    }
  }
}
