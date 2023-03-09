import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dema_app/view/screens/home_page_admin.dart';
import 'package:flutter_dema_app/view/widgets/custom_button.dart';
import 'package:flutter_dema_app/view/widgets/custom_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController nameProjectController = TextEditingController();
  TextEditingController describeProjectController = TextEditingController();
  TextEditingController nameCharityController = TextEditingController();
  TextEditingController addressCharityController = TextEditingController();
  TextEditingController emailCharityController = TextEditingController();
  TextEditingController benefitsNameController = TextEditingController();
 // final postRef = FirebaseDatabase.instance.ref().child('Posts');
  final _formKey = GlobalKey<FormState>();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  CollectionReference fireStoreData =
      FirebaseFirestore.instance.collection("addData");
  bool showSpinner = false;
  File? _image;
  final picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        toastMethod('No Image Selected');
      }
    });
  }

  void toastMethod(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black45,
        fontSize: 16.0);
  }

  Future getImageCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        toastMethod('No Image Selected');
      }
    });
  }

  void dialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: SizedBox(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      getImageCamera();
                      Navigator.pop(context);
                    },
                    child: const ListTile(
                      leading: Icon(Icons.camera),
                      title: Text('camera'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getImageGallery();
                      Navigator.pop(context);
                    },
                    child: const ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text(
          'أضافه القسم الخيري',
          style: TextStyle(
              fontSize: 18, color: Colors.black54, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomizedTextField(
                myController: nameProjectController,
                hintText: "اسم المشروع الخيري",
                isPassword: false,
                validate: (value) {
                  if(value!.isEmpty){
                    return 'please enter projectName';
                  }
                  return null;
                },
              ),
              CustomizedTextField(
                myController: describeProjectController,
                hintText: "وصف المشروع",
                isPassword: false,
                validate: (value) {
                  if(value!.isEmpty){
                    return 'please enter describeProject';
                  }
                  return null;
                },
              ),
              CustomizedTextField(
                myController: nameCharityController,
                hintText: "اسم الجمعية الخيرية",
                isPassword: false,
                validate: (value) {
                  if(value!.isEmpty){
                    return 'please enter nameCharity';
                  }
                  return null;
                },
              ),
              CustomizedTextField(
                myController: addressCharityController,
                hintText: "عنوان الجمعية الخيريه",
                isPassword: false,
                validate: (value) {
                  if(value!.isEmpty){
                    return 'please enter addressCharity';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  // controller: firebaseAuthService.loginEmailAdminController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                      hintText: "البريد الكتروني الخاص بالجمعية",
                      hintStyle:
                      TextStyle(color: Colors.black54, fontSize: 17.sp),
                      fillColor: const Color(0xffE8ECF4),
                      filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'please enter email';
                    }
                    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                      return 'Please a valid Email';
                    }
                    return null;
                  },
                  // onSaved: (text) {
                  //   text
                  //   email = text!;
                  // },
                ),
              ),
              // CustomizedTextField(
              //   myController: emailCharityController,
              //   hintText: "البريد الاكتونى الخاص بالجمعية",
              //   isPassword: false,
              // ),
              CustomizedTextField(
                myController: benefitsNameController,
                hintText: "المستفادين",
                isPassword: false,
                validate: (value) {
                  if(value!.isEmpty){
                    return 'please enter benefitsName';
                  }
                  return null;
                },
              ),
              InkWell(
                onTap: () {
                  dialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * 1,
                      child: _image != null
                          ? ClipRRect(
                              child: Image.file(
                                _image!.absolute,
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 100,
                              height: 100,
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.blue,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              CustomizedButton(
                buttonText: "حفظ",
                buttonColor: Colors.black,
                textColor: Colors.white,
                onPressed: () async {
                  if (_formKey.currentState!.validate()){
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      int date = DateTime.now().microsecondsSinceEpoch;
                      firebase_storage.Reference ref = firebase_storage
                          .FirebaseStorage.instance
                          .ref('dema$date');
                      var uploadTask = ref.putFile(_image!.absolute);
                      await Future.value(uploadTask);
                      var newUrl = await ref.getDownloadURL();
                      final User? user = _auth.currentUser;
                      CollectionReference dataReference=  FirebaseFirestore.instance.collection("data");
                      dataReference.doc(date.toString()).set({
                        'pId': "${date}1",
                        'pImage': newUrl.toString(),
                        'pTime': date.toString(),
                        'pNameProject': nameProjectController.text.toString(),
                        'pDescriptionProject':
                        describeProjectController.text.toString(),
                        'pNameCharity': nameCharityController.text.toString(),
                        'pAddressCharity': addressCharityController.text.toString(),
                        'pEmailCharity': emailCharityController.text.toString(),
                        'pBenefits': benefitsNameController.text.toString(),
                        'uEmail': user!.email.toString(),
                        'uId': user.uid.toString(),
                      },SetOptions(merge: true)
//                   postRef.child('Post List').child(date.toString()).set(
//                   //     {
//                   //   CategoryModel(
//                   //     id: "${date}1",
//                   //     nameProject:nameProjectController.text.toString(),
//                   //     describeProject:describeProjectController.text.toString(),
//                   //     nameCharity: nameCharityController.text.toString(),
//                   //     addressCharity: addressCharityController.text.toString(),
//                   //     benefitsName:  benefitsNameController.text.toString(),
//                   //     emailCharity: emailCharityController.text.toString(),
//                   //     image: newUrl.toString(),
//                   //   )
//                   // }
// z
//                     {
//                     'pId': date.toString(),
//                     'pImage': newUrl.toString(),
//                     'pTime': date.toString(),
//                     'pNameProject': nameProjectController.text.toString(),
//                     'pDescriptionProject':
//                         describeProjectController.text.toString(),
//                     'pNameCharity': nameCharityController.text.toString(),
//                     'pAddressCharity': addressCharityController.text.toString(),
//                     'pEmailCharity': emailCharityController.text.toString(),
//                     'pBenefits': benefitsNameController.text.toString(),
//                     'uEmail': user!.email.toString(),
//                     'uId': user.uid.toString(),
//                   }
                      ).then((value) {
                        toastMethod('post published');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomePageAdmin()));
                        setState(() {
                          showSpinner = false;
                        });
                      }).onError((error, stackTrace) {
                        toastMethod(error.toString());
                        setState(() {
                          showSpinner = false;
                        });
                      });
                    } catch (e) {
                      setState(() {
                        showSpinner = false;
                      });
                      toastMethod(e.toString());
                    }
                  }else {
                    if (kDebugMode) {
                      print("error");
                    }
                  }


                },
                /* async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    int date = DateTime.now().microsecondsSinceEpoch;
                    firebase_storage.Reference ref = firebase_storage
                        .FirebaseStorage.instance
                        .ref('donation$date');
                    var uploadTask = ref.putFile(_image!.absolute);
                    await Future.value(uploadTask);
                    var newUrl = await ref.getDownloadURL();
                    final User? user = _auth.currentUser;
                  await fireStoreData.doc(date.toString()).set({
                      'pId': date.toString(),
                      'pImage': newUrl.toString(),
                      'pTime': date.toString(),
                      'pNameProject': nameProjectController.text.toString(),
                      'pDescriptionProject':
                          describeProjectController.text.toString(),
                      'pNameCharity': nameCharityController.text.toString(),
                      'pAddressCharity': addressCharityController.text.toString(),
                      'pEmailCharity': emailCharityController.text.toString(),
                      'pBenefits': benefitsNameController.text.toString(),
                      'uEmail': user!.email.toString(),
                      'uId': user.uid.toString(),
                    }).then((value) {
                      toastMethod('post published');
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                      setState(() {
                        showSpinner = false;
                      });
                    }).onError((error, stackTrace) {
                      toastMethod(error.toString());
                      setState(() {
                        showSpinner = false;
                      });
                    });
                  } catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    toastMethod(e.toString());
                  }
                },
                */
              ),
            ],
          ),
        ),
      ),
    );
  }
}
