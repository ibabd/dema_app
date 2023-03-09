import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dema_app/services/firebase_auth_services.dart';
import 'package:flutter_dema_app/view/screen2/admin_login_screen.dart';
import 'package:flutter_dema_app/view/screen2/main_screen.dart';
import 'package:flutter_dema_app/view/screen2/sign_up_user.dart';
import 'package:flutter_dema_app/view/screens/forget_password.dart';
import 'package:flutter_dema_app/view/widgets/custom_button.dart';
import 'package:flutter_dema_app/view/widgets/custom_textfield.dart';

class SignInUser extends StatefulWidget {
  const SignInUser({Key? key}) : super(key: key);

  @override
  State<SignInUser> createState() => _SignInUserState();
}

class _SignInUserState extends State<SignInUser> {
  bool remember = false;
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();
  bool passwordRequest=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/Charity.png",
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 160,
                    left: 160,
                    child: Image.asset(
                      "assets/images/Dema-Logo.png",
                      width: 120,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                child:  CustomizedTextField(
                    myController:firebaseAuthService.emailController,
                    hintText: "البريد الإكتروني",
                    isPassword: false,
                  validate:(value) {
                    if(value!.isEmpty){
                      return 'please enter email';
                    }
                    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                      return 'Please a valid Email';
                    }
                    return null;
                  },
                ),
                    /*
                TextFormField(

                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                      hintText: "الهويه",
                      hintStyle:
                          const TextStyle(color: Colors.black12, fontSize: 17),
                      fillColor: Colors.grey[300],
                      filled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white10,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )),
                    validator: (value){

                      return value!.isEmpty ? 'enter email' : null;
                    },

                  // onSaved: (val){
                  //   firebaseAuthService.loginEmailController=val;
                  // },
                ),
                */
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                child: TextFormField(
                  obscureText: passwordRequest,
                   controller: firebaseAuthService.passwordController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: (){
                        setState((){
                          passwordRequest=!passwordRequest;
                        });
                      },
                      icon: Icon(
                        passwordRequest?
                        Icons.visibility_off: Icons.visibility,
                        color: Colors.grey,
                        size: 22,
                      ),
                    ),
                    hintText: "الرقم السري",
                    // hintStyle:
                    // TextStyle(color: Colors.black54, fontSize: 17.sp),
                    //
                    // enabledBorder: OutlineInputBorder(
                    //     borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                    //     borderRadius: BorderRadius.circular(10)),
                    // focusedBorder: OutlineInputBorder(
                    //     borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                    //     borderRadius: BorderRadius.circular(10)),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: const Color(0xffE8ECF4),
                    filled: true,
                    // hintText: widget.hintText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'please enter password';
                    }

                    return null;
                  },
                  // onSaved: (text) {
                  //   text
                  //   email = text!;
                  // },
                ),
               /*
                CustomizedTextField(
                  myController:firebaseAuthService.passwordController,
                  hintText: "كلمة المرور",
                  isPassword: true,
                  validate:(value) {
                    if(value!.isEmpty){
                      return 'please enter password';
                    }
                    return null;
                  },
                ),
                    */
                    /*
                TextFormField(
                  textAlign: TextAlign.right,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.visibility_outlined,
                        color: Colors.black12,
                      ),
                      hintText: "كلمه المرور",
                      hintStyle:
                          const TextStyle(color: Colors.black12, fontSize: 17),
                      fillColor: Colors.grey[300],
                      filled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white10,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  validator: (value){

                    return value!.isEmpty ? 'enter password' : null;
                  },

                ),
                */
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()));
                      },
                      child: const Text("هل نسيت كلمة السر",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 15,
                          )),
                    ),
                    Row(
                      children: [
                        const Text(
                          "تذكرني",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Checkbox(
                          activeColor: Colors.green,
                          value: remember,
                          onChanged: ((val) {
                            setState(() {
                              remember = val!;
                            });
                          }),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                child: CustomizedButton(
                  buttonText: "تسجيل الدخول",
                  buttonColor: Colors.green,
                  textColor: Colors.white,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await firebaseAuthService.loginUser(context);
                    } else {
                      if (kDebugMode) {
                        print("error");
                      }
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "أو",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                child: CustomizedButton(
                  buttonText: " إستمرار كزائر",
                  buttonColor: const Color.fromRGBO(14, 19, 49, 1),
                  textColor: Colors.white,
                  onPressed: () async {
                    UserCredential userCredential=await FirebaseAuth.instance.signInAnonymously();
                    if (kDebugMode) {
                      print(userCredential);
                    }
                    if (!mounted) return;
                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainScreen()), (route) => false);

                  },
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: TextButton(
                    onPressed: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminLoginScreen()));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminLogin()));
                    },
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: Text("دخول كاأدمن",style: TextStyle(fontSize: 18,color: Colors.black),))
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SignUpUser()));
                  },
                  child: const Text(
                    "إنشاء حساب جديد",
                    style: TextStyle(
                        color: Color.fromRGBO(14, 19, 49, 1), fontSize: 17),
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
