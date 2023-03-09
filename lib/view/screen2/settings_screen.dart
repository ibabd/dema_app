import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dema_app/view/screen2/sign_in_user.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
 State<SettingsScreen>  createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الأعدادات"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("تسجيل الخروج",style: TextStyle(fontSize: 17,color: Colors.black54),),
            trailing:IconButton(
              onPressed: ()async{
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainScreen()));
                await FirebaseAuth.instance.signOut();
                if (!mounted) return;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return const SignInUser();
                    }));
              },
              icon: const Icon(Icons.logout,color: Colors.blue,size: 20,),
            ),
          ),

        ],
      ),
    );
  }
}
