import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dema_app/services/firebase_auth_services.dart';
import 'package:flutter_dema_app/view/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();
  bool passwordRequest=true;
  // var email = FirebaseAuthService().loginEmailAdminController;
  // var password = FirebaseAuthService().loginPasswordAdminController;

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
                    height: 450.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 280.h,
                    left: 170.w,
                    child: Image.asset(
                      "assets/images/Dema-Logo.png",
                      width: 120.w,
                      height: 50.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                child: TextFormField(
                  // controller: firebaseAuthService.loginEmailAdminController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                      hintText: "البريدالأكتروني",
                      hintStyle:
                           TextStyle(color: Colors.black12, fontSize: 17.sp),
                      fillColor: Colors.grey[300],
                      filled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white10,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onChanged: (value) {
                    setState(() {
                      firebaseAuthService.adminEmailController.text=value;
                      //value= firebaseAuthService.adminEmailController.text ;
                    });
                  },
                  validator: (value) {
                    return value!.isEmpty ? 'enter email' : null;
                  },
                  // onSaved: (text) {
                  //   text
                  //   email = text!;
                  // },
                ),
              ),
               SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                child: TextFormField(
                  obscureText: passwordRequest,
                  //controller:firebaseAuthService.loginPasswordAdminController,
                  textAlign: TextAlign.right,
                  decoration:InputDecoration(
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
                      hintText: "كلمة المرور",
                      hintStyle:
                      TextStyle(color: Colors.black12, fontSize: 17.sp),
                      fillColor: Colors.grey[300],
                      filled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white10,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  // InputDecoration(
                  //
                  //   hintText: "الرقم السري",
                  //   // hintStyle:
                  //   // TextStyle(color: Colors.black54, fontSize: 17.sp),
                  //   //
                  //   // enabledBorder: OutlineInputBorder(
                  //   //     borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                  //   //     borderRadius: BorderRadius.circular(10)),
                  //   // focusedBorder: OutlineInputBorder(
                  //   //     borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                  //   //     borderRadius: BorderRadius.circular(10)),
                  //   // border: OutlineInputBorder(
                  //   //   borderRadius: BorderRadius.circular(10),
                  //   // ),
                  //   enabledBorder: OutlineInputBorder(
                  //       borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                  //       borderRadius: BorderRadius.circular(10)),
                  //   focusedBorder: OutlineInputBorder(
                  //       borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                  //       borderRadius: BorderRadius.circular(10)),
                  //   fillColor: const Color(0xffE8ECF4),
                  //   filled: true,
                  //   // hintText: widget.hintText,
                  //   border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  // ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'please enter password';
                    }

                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      firebaseAuthService.adminPasswordController.text=value;
                      //value= firebaseAuthService.adminPasswordController.text ;
                    });
                  },
                  // onSaved: (text) {
                  //   text
                  //   email = text!;
                  // },
                ),
                 /*
                TextFormField(
                  // controller:firebaseAuthService.loginPasswordAdminController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.visibility_outlined,
                        color: Colors.black12,
                      ),
                      hintText: "كلمه المرور",
                      hintStyle:
                           TextStyle(color: Colors.black12, fontSize: 17.sp),
                      fillColor: Colors.grey[300],
                      filled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white10,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      firebaseAuthService.adminPasswordController.text=value;
                      //value= firebaseAuthService.adminPasswordController.text ;
                    });
                  },
                  validator: (value) {
                    return value!.isEmpty ? 'enter password' : null;
                  },
                  // onSaved: (text) {
                  //   password = text!;
                  // },
                ),
                */
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, left: 17.0, right: 17.0),
                child: CustomizedButton(
                  buttonText: "تسجيل الدخول",
                  buttonColor: Colors.green,
                  textColor: Colors.white,
                  onPressed: () async {
                    var formdata = _formKey.currentState;
                    if (formdata!.validate()) {
                      //formdata.save();
                      await firebaseAuthService.loginAdmin(context);
                          // .signInAdmin(
                          //     email:
                          //         firebaseAuthService.loginEmailAdminController,
                          //     password: firebaseAuthService
                          //         .loginPasswordAdminController)
                          // .then((value) => Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const DashboardScreen()),
                          //     (route) => false));
                    } else {
                      if (kDebugMode) {
                        print("error");
                      }
                    }
                  },
                ),
              ),
               SizedBox(
                height: 8.h,
              ),
              // TextButton(
              //     onPressed: () {},
              //     child:  Text(
              //       "إنشاء حساب جديد",
              //       style: TextStyle(
              //           color: const Color.fromRGBO(14, 19, 49, 1), fontSize: 17.sp),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
