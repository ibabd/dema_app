import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dema_app/view/widgets/custom_button.dart';
import 'package:flutter_dema_app/view/widgets/custom_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({Key? key}) : super(key: key);

  @override
 State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  TextEditingController nameProjectController = TextEditingController();
  TextEditingController describeProjectController = TextEditingController();
  TextEditingController nameCharityController = TextEditingController();
  TextEditingController addressCharityController = TextEditingController();
  TextEditingController emailCharityController = TextEditingController();
  TextEditingController benefitsNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  //int date = DateTime.now().microsecondsSinceEpoch;
  CollectionReference dataRef=FirebaseFirestore.instance.collection("data");
  FirebaseAuth auth=FirebaseAuth.instance;
  bool showSpinner = false;
  File? image;
  //final picker = ImagePicker();
  String uniqueImageName=DateTime.now().microsecondsSinceEpoch.toString();
  Reference referenceRoot=firebase_storage.FirebaseStorage.instance.ref();
  
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
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
        image = File(pickedFile.path);
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
        title:Text('أقسام التبرعات',style: TextStyle(fontSize: 17.sp,color: Colors.black,),),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child:FutureBuilder<QuerySnapshot>(
                future:dataRef.get() ,
                builder:(context,snapshot){
                  if(snapshot.hasData){
                    return ListView.separated(
                        itemCount:snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot=
                              snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 15,right: 10,left: 10,),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade100,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                    fit: BoxFit.fill,
                                    height: 300.h,
                                    width: double.infinity,
                                    placeholder: 'assets/images/loading.gif',
                                    image:documentSnapshot["pImage"],
                                    //snapshot.data!.docs[index]["pImage"],
                                  ),
                                ),
                                 SizedBox(
                                  height: 10.h,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      documentSnapshot["pNameProject"],
                                      //snapshot.data!.docs[index]["pNameProject"],
                                      style:  TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 2,bottom: 10),
                                    child: Text(
                                      documentSnapshot["pDescriptionProject"],
                                      //snapshot.data!.docs[index]['pDescriptionProject']!,
                                      style:  TextStyle(fontSize:15.sp,fontWeight: FontWeight.normal,color: Colors.black),),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text("   اسم الجمعيه  :${
                                        documentSnapshot["pNameCharity"]}",
                                        //snapshot.data!.docs[index]['pNameCharity']!}",
                                      style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text("  العنوان  :${
                                   documentSnapshot["pAddressCharity"]}",
                                   //snapshot.data!.docs[index]['pAddressCharity']!}",
                                   style:TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text("  ${
                                   documentSnapshot["pEmailCharity"]} :    البريد االكتروني",
                                  // snapshot.data!.docs[index]['pEmailCharity']!}    :  البريد الاكترونى",
                                   style:TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,),),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text("  المستفادون  :  ${
                                         documentSnapshot["pBenefits"]}"
                                        //snapshot.data!.docs[index]['pBenefits']!}",
                                      ,style:TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    /*
                                    IconButton(
                                      onPressed: (){
                                        nameProjectController.text=documentSnapshot['pNameProject'];
                                        describeProjectController.text=documentSnapshot['pDescriptionProject'];
                                        nameCharityController.text=documentSnapshot['pNameCharity'];
                                        addressCharityController.text=documentSnapshot['pAddressCharity'];
                                        emailCharityController.text=documentSnapshot['pEmailCharity'];
                                        benefitsNameController.text=documentSnapshot['pBenefits'];
                                        showDialog(
                                          context: context,
                                          builder:(context)=>Dialog(
                                            child: Container(
                                              color: Colors.teal,
                                              child: ListView(
                                                shrinkWrap: true,
                                                children: [
                                                  Form(
                                                    key: _formKey,
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
                                                            controller: emailCharityController,

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
                                                          ),
                                                        ),
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
                                                                child:ClipRRect(
                                                                  child:Image.network("${documentSnapshot["pImage"]}",
                                                                    height: 100,
                                                                    width: 100,
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                  // Image.file(
                                                                  //   _image!.absolute,
                                                                  //   height: 100,
                                                                  //   width: 100,
                                                                  //   fit: BoxFit.fill,
                                                                  // ),
                                                                )
                                                                // _image != null
                                                                //     ?
                                                                //     : Container(
                                                                //   decoration: BoxDecoration(
                                                                //     color: Colors.grey.shade300,
                                                                //     borderRadius: BorderRadius.circular(10),
                                                                //   ),
                                                                //   width: 100,
                                                                //   height: 100,
                                                                //   child: const Icon(
                                                                //     Icons.camera_alt,
                                                                //     color: Colors.blue,
                                                                //   ),
                                                                // ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        // InkWell(
                                                        //
                                                        //   onTap: () {
                                                        //     dialog(context);
                                                        //   },
                                                        //   child: Padding(
                                                        //     padding: const EdgeInsets.all(10),
                                                        //     child: Center(
                                                        //       child: SizedBox(
                                                        //         height: MediaQuery.of(context).size.height * .2,
                                                        //         width: MediaQuery.of(context).size.width * 1,
                                                        //         child: _image != null
                                                        //             ? ClipRRect(
                                                        //           child: Image.file(
                                                        //             _image!.absolute,
                                                        //             height: 100.h,
                                                        //             width: 100.w,
                                                        //             fit: BoxFit.fill,
                                                        //           ),
                                                        //         )
                                                        //             : Container(
                                                        //           decoration: BoxDecoration(
                                                        //             color: Colors.grey.shade300,
                                                        //             borderRadius: BorderRadius.circular(10),
                                                        //           ),
                                                        //           width: 100,
                                                        //           height: 100,
                                                        //           child: const Icon(
                                                        //             Icons.camera_alt,
                                                        //             color: Colors.blue,
                                                        //           ),
                                                        //         ),
                                                        //       ),
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                        CustomizedButton(
                                                          buttonText: "تعديل",
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
                                                                dataReference.doc(documentSnapshot['pTime']).update({
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
                                                                },
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
                                                                  toastMethod('post update');
                                                                  Navigator.pop(context);
                                                                  setState(() {
                                                                    showSpinner = false;
                                                                  });
                                                                }).onError((error, stackTrace) {
                                                                  toastMethod(error.toString());
                                                                  if (kDebugMode) {
                                                                    print(error.toString());
                                                                  }
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
                                                           // documentSnapshot[index].
                                                            /*
                                                            dataRef.doc(documentSnapshot['pTime']).update({
                                                            documentSnapshot['pNameProject']: nameProjectController.text,
                                                            documentSnapshot['pDescriptionProject']:describeProjectController.text,
                                                            documentSnapshot['pNameCharity']:nameCharityController.text,
                                                            documentSnapshot['pAddressCharity'] :addressCharityController.text,
                                                            documentSnapshot['pEmailCharity']:emailCharityController.text,
                                                              documentSnapshot['pBenefits']:benefitsNameController.text
                                                            }).whenComplete(() => Navigator.pop(context));
                                                            */
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        );
                                      },
                                      icon: const Icon(Icons.edit,size: 20,color: Colors.black38,),
                                    ),
                                    */
                                    IconButton(
                                      onPressed: (){
                                        setState((){
                                          _deletePost(snapshot.data!.docs[index]['pTime']);
                                        });
                                      },
                                      icon: const Icon(Icons.delete,size:35,color: Colors.red,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20,),
                    );
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  
  _deletePost(id){
    FirebaseFirestore.instance.collection("data").doc(id).delete();
    Fluttertoast.showToast(msg: "posted Deleted");
  }
}