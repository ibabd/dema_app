import 'package:flutter/material.dart';
import 'package:flutter_dema_app/services/firebase_auth_services.dart';
import 'package:flutter_dema_app/view/widgets/custom_button.dart';
import 'package:flutter_dema_app/view/widgets/custom_textfield.dart';

class SignUpUser extends StatefulWidget {
  const SignUpUser({Key? key}) : super(key: key);

  @override
  State<SignUpUser> createState() => _SignUpUserState();
}

class _SignUpUserState extends State<SignUpUser> {
  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _numberPhoneController = TextEditingController();
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();
  bool passwordRequest=true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,right: 20.0,left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      IconButton(
                          icon: const Icon(Icons.arrow_back,size: 30,color: Colors.black,),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      const Text(
                        "إنشاء حساب جديد",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text("من فضلك قم بإستكمال بياناتك", style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text("اسم المستخدم", style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0,right: 10.0),
                  child: CustomizedTextField(
                      myController:firebaseAuthService.usernameController,
                      hintText: "اسم المستخدم",
                      isPassword: false,
                    validate: (value) {
                      if(value!.isEmpty){
                        return 'please enter name';
                      }

                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text("رقم الجوال", style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0,right: 10.0),
                  child: CustomizedTextField(
                      myController:firebaseAuthService.numberPhoneController,
                      hintText: "رقم الجوال",
                      isPassword: false,
                    validate: (value) {
                      if(value!.isEmpty){
                        return 'please enter phone number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text("البريد الإكتروني", style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0,right: 10.0),
                  child: CustomizedTextField(
                      myController:firebaseAuthService.emailController,
                      hintText: "البريد الإكتروني",
                      isPassword: false,
                    validate: (value) {
                      if(value!.isEmpty){
                        return 'please enter email';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text("كلمة المرور", style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0,right: 10.0),
                  child:TextFormField(
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
                    validate: (value) {
                      if(value!.isEmpty){
                        return 'please enter password';
                      }
                      return null;
                    },
                  ),
                  */
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0,right: 10.0),
                  child: CustomizedButton(
                    buttonText: "إنشاء حساب",
                    buttonColor: Colors.green,
                    textColor: Colors.white,
                    onPressed: () async {
                      await firebaseAuthService.createAccount(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
