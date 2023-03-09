import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dema_app/services/database.dart';
import 'package:flutter_dema_app/services/firebase_auth_services.dart';
import 'package:flutter_dema_app/view/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DbHelper ? dbHelper=DbHelper();
  // final DatabaseReference dbRef =
  //     FirebaseDatabase.instance.ref().child('Posts');

  //final ref=dbRef.child('Post List');
  FirebaseAuth auth = FirebaseAuth.instance;
  String search='';
  final String? userName =
      FirebaseAuth.instance.currentUser!.displayName.toString();
  final String? email = FirebaseAuth.instance.currentUser!.email.toString();
  final String? phone =
      FirebaseAuth.instance.currentUser!.phoneNumber.toString();
  // List<DatabaseReference> categories =
  //     List<DatabaseReference>.empty(growable: true);
  final fireStore = FirebaseFirestore.instance;
  TextEditingController searchController=TextEditingController();
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  CollectionReference dataRef=FirebaseFirestore.instance.collection("data");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // final cart=Provider.of<Cart>(context);
    // GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey();
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right:10),
              child: Text(
                " أبواب ألخير ",
                style: TextStyle(
                    fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left:15),
            child: IconButton(
              onPressed: ()async{
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,color: Colors.black54,size: 20,),
            ),
          ),
        ),

        body:Padding(
          padding: const EdgeInsets.only(top: 70,right: 25,left: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/filter_icon.png",width: 18,height:40,fit: BoxFit.fill,),
                   // const Icon(MyFlutterApp.sliders,color: Colors.black,),
                    const SizedBox(width:10,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:  BorderRadius.circular(10),
                        ),
                        child:TextField(
                          controller: searchController,
                          textAlign: TextAlign.right,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'بحث في أبواب ألخير',
                            prefixIcon: Icon(Icons.search,size: 30,color: Colors.black54,),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                          ),
                          onChanged: (String value){
                            setState(() {
                              search=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                FutureBuilder<QuerySnapshot>(
                  future: dataRef.get(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return GridView.builder(
                        padding: const EdgeInsets.only(top: 20,bottom: 20),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data=snapshot.data!.docs[index].data() as Map<String,dynamic>;
                          if(search.isEmpty){
                            return  InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(
                                  id: snapshot.data!.docs[index]["pId"],
                                  nameProject: snapshot.data!.docs[index]["pNameProject"],
                                  image: snapshot.data!.docs[index]["pImage"],
                                  nameCharity: snapshot.data!.docs[index]["pNameCharity"],
                                  addressCharity: snapshot.data!.docs[index]["pAddressCharity"],
                                  description:snapshot.data!.docs[index]["pDescriptionProject"],
                                  benefitsPeople:snapshot.data!.docs[index]["pBenefits"],
                                  emailCharity: snapshot.data!.docs[index]["pEmailCharity"],
                                )));
                              },
                              child: Container(
                                width: double.infinity,
                                //margin: const EdgeInsets.only(right: 8,left: 8,bottom: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey,width: 2),
                                  image:  DecorationImage(
                                    image:NetworkImage( snapshot.data!.docs[index]["pImage"],),
                                    fit: BoxFit.fill,

                                  ),
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child:  InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(
                                      id: snapshot.data!.docs[index]["pId"],
                                      nameProject: snapshot.data!.docs[index]["pNameProject"],
                                      image: snapshot.data!.docs[index]["pImage"],
                                      nameCharity: snapshot.data!.docs[index]["pNameCharity"],
                                      addressCharity: snapshot.data!.docs[index]["pAddressCharity"],
                                      description:snapshot.data!.docs[index]["pDescriptionProject"],
                                      benefitsPeople:snapshot.data!.docs[index]["pBenefits"],
                                      emailCharity: snapshot.data!.docs[index]["pEmailCharity"],
                                    )));
                                  },
                                  child:Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text("${snapshot.data!.docs[index]["pNameProject"]}",style: const TextStyle(
                                        height: 1.3,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.green,
                                      ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }if(data["pNameProject"].toString().contains(search.toLowerCase())){
                            return  InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(
                                  id: data["pId"],
                                  nameProject: data["pNameProject"],
                                  image: data["pImage"],
                                  nameCharity: data["pNameCharity"],
                                  addressCharity: data["pAddressCharity"],
                                  description:data["pDescriptionProject"],
                                  benefitsPeople:data["pBenefits"],
                                  emailCharity: data["pEmailCharity"],
                                )));
                              },
                              child: GridTile(
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(right: 8,left: 8,bottom: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey,width: 2),
                                    image:  DecorationImage(
                                      image:NetworkImage( data["pImage"]),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child:  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(
                                        id: snapshot.data!.docs[index]["pId"],
                                        nameProject: snapshot.data!.docs[index]["pNameProject"],
                                        image: snapshot.data!.docs[index]["pImage"],
                                        nameCharity: snapshot.data!.docs[index]["pNameCharity"],
                                        addressCharity: snapshot.data!.docs[index]["pAddressCharity"],
                                        description:snapshot.data!.docs[index]["pDescriptionProject"],
                                        benefitsPeople:snapshot.data!.docs[index]["pBenefits"],
                                        emailCharity: snapshot.data!.docs[index]["pEmailCharity"],
                                      )));
                                    },
                                    child:Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text("${data["pNameProject"]}",style: const TextStyle(
                                          height: 1.3,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.green,
                                        ),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container();
                        },
                      );
                    }else{
                      return const Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
 Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: FutureBuilder<QuerySnapshot>(
                  future:dataRef.get() ,
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return ListView.separated(
                        itemCount:snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15,right: 10,left: 10,),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(
                                    id: snapshot.data!.docs[index]["pId"],
                                    nameProject:snapshot.data!.docs[index]["pNameProject"],
                                    image:snapshot.data!.docs[index]["pImage"],
                                    nameCharity:snapshot.data!.docs[index]["pNameCharity"],
                                    addressCharity:snapshot.data!.docs[index]["pAddressCharity"],
                                    description:snapshot.data!.docs[index]["pDescriptionProject"],
                                    benefitsPeople:snapshot.data!.docs[index]["pBenefits"],
                                    emailCharity:snapshot.data!.docs[index]["pEmailCharity"],
                                )));
                              },
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
                                        height: 300,
                                        width: double.infinity,
                                        placeholder: 'assets/images/loading.gif',
                                        image: snapshot.data!.docs[index]["pImage"],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              snapshot.data!.docs[index]["pNameProject"],
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Consumer<Cart>(builder:
                                            (context, cartInstance, child) {
                                          return IconButton(
                                            onPressed: () {
                                              dbHelper!.insertCart(CartModel(
                                                id: index,
                                                productId: index.toString(),
                                                productName: snapshot.data!.docs[index]["pNameProject"].toString(),
                                               // productPrice: productPrice[index],
                                               // initialPrice: productPrice[index],
                                                quantity: 1,
                                               // unitTag: productUnit[index].toString(),
                                                image:snapshot.data!.docs[index]["pImage"].toString(),
                                              ),
                                              ).then((value) {
                                                if (kDebugMode) {
                                                  print('product is added to cart');
                                                }
                                                //cart.addTotalPrice(double.parse( productPrice[index].toString()));
                                                cart.addCounter();
                                              }).onError((dynamic error,dynamic stackTrace){
                                                if (kDebugMode) {
                                                  print(error.toString());
                                                }
                                              });
                                             // cartInstance.add(snapshot.data!.docs[index]);
                                            },
                                            icon: const Icon(
                                              // Icons.shopping_cart,
                                              Icons.shopping_cart,
                                              color: Colors.black,
                                              size: 35,
                                            ),
                                          );
                                        }),
                                      ],
                                    ),

                                    // Padding(
                                    //   padding: const EdgeInsets.only(right: 2,bottom: 10),
                                    //   child: Text(snapshot.data!.docs[index]['pDescriptionProject']!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                                    // ),
                                    // Align(
                                    //   alignment: Alignment.topRight,
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    //     child: Text("   اسم الجمعيه  :${snapshot.data!.docs[index]['pNameCharity']!}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    //   ),
                                    // ),
                                    // Align(
                                    //   alignment: Alignment.topRight,
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    //     child: Text("  العنوان  :${snapshot.data!.docs[index]['pAddressCharity']!}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    //   ),
                                    // ),
                                    // Align(
                                    //   alignment: Alignment.topRight,
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    //     child: Text("  ${snapshot.data!.docs[index]['pEmailCharity']!}    :  البريد الاكترونى",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    //   ),
                                    // ),
                                    // Align(
                                    //   alignment: Alignment.topRight,
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    //     child: Text("  المستفادون  :  ${snapshot.data!.docs[index]['pBenefits']!}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    //   ),
                                    // ),
                                  ],
                                ),
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

              /*
              Expanded(
                child: FirebaseAnimatedList(
                  query:dbRef.child('Post List'),

                  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                    Map<dynamic, dynamic> values = snapshot.value! as Map<dynamic, dynamic>;
                    //String tempTitle=values['pTitle']!;
                    return Padding(
                      padding: const EdgeInsets.all(5),
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
                                height: 300,
                                width: double.infinity,
                                placeholder: 'assets/images/loading.gif',
                                image: values['pImage']!,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text( values['pNameProject']!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                Consumer<Cart>(builder: (context, cartInstance, child) {
                                  return IconButton(
                                    onPressed: (){
                                      cartInstance.add(dbRef.child('Post List'));
                                      //cartInstance.add(categories[index]);
                                    },
                                    icon: const Icon(
                                      // Icons.shopping_cart,
                                      Icons.shopping_cart,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                  );
                                }),

                              ],
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.only(right: 2,bottom: 10),
                            //   child: Text(values['pDescriptionProject']!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                            // ),
                            // Align(
                            //   alignment: Alignment.topRight,
                            //   child: Padding(
                            //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            //     child: Text("   اسم الجمعيه  :${values['pNameCharity']!}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            //   ),
                            // ),
                            //       Align(
                            //         alignment: Alignment.topRight,
                            //         child: Padding(
                            //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            //           child: Text("  العنوان  :${values['pAddressCharity']!}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            //         ),
                            //       ),
                            //       Align(
                            //         alignment: Alignment.topRight,
                            //         child: Padding(
                            //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            //           child: Text("  ${values['pEmailCharity']!}    :  البريد الاكترونى",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            //         ),
                            //       ),
                            //       Align(
                            //         alignment: Alignment.topRight,
                            //         child: Padding(
                            //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            //           child: Text("  المستفادون  :  ${values['pBenefits']!}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            //         ),
                            //       ),
                          ],
                        ),
                      ),
                    );
                    // else if(tempTitle.toLowerCase().contains(searchController.text.toString())){
                    //   return Padding(
                    //     padding: const EdgeInsets.all(10.0),
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         color: Colors.grey.shade100,
                    //       ),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           ClipRRect(
                    //             borderRadius: BorderRadius.circular(10),
                    //             child: FadeInImage.assetNetwork(
                    //               fit: BoxFit.fill,
                    //               height: MediaQuery.of(context).size.height*.2,
                    //               width: MediaQuery.of(context).size.width*.25,
                    //               placeholder: 'images/logo.jpg',
                    //               image: values['pImage']!,
                    //             ),
                    //           ),
                    //           SizedBox(height: 10,),
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //             child: Text(values['pTitle']!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 10),
                    //             child: Text(values['pDescription']!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   );
                    // }else{
                    //   return Container();
                    // }
                  },


                ),
              ),
              */
            ],
          ),
        ),
 */


/*
StreamBuilder(
                  stream: dbRef.child('Post List').onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      Map<dynamic, dynamic> map =
                          snapshot.data!.snapshot.value as dynamic;
                      List<dynamic> list = [];
                      list.clear();
                      list = map.values.toList();
                      return ListView.separated(
                          itemCount: snapshot.data!.snapshot.children.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                //Navigator.pushNamed(context, DetailsScreen.route,arguments: list[index]["pId"]);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(
                                  id: list[index]["pId"],
                                  nameProject: list[index]["pNameProject"],
                                  image: list[index]["pImage"],
                                  nameCharity: list[index]["pNameCharity"],
                                  addressCharity: list[index]["pAddressCharity"],
                                  description:list[index]["pDescriptionProject"],
                                  benefitsPeople:list[index]["pBenefits"],
                                  emailCharity: list[index]["pEmailCharity"],
                                )));
                              },
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
                                        height: 300,
                                        width: double.infinity,
                                        placeholder: 'assets/images/loading.gif',
                                        image: list[index]["pImage"],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              list[index]["pNameProject"],
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Consumer<Cart>(builder:
                                            (context, cartInstance, child) {
                                          return IconButton(
                                            onPressed: () {
                                              cartInstance.add(list[index]);
                                            },
                                            icon: const Icon(
                                              // Icons.shopping_cart,
                                              Icons.shopping_cart,
                                              color: Colors.black,
                                              size: 35,
                                            ),
                                          );
                                        }),
                                      ],
                                    ),

                                    // Padding(
                                    //   padding: const EdgeInsets.only(right: 2,bottom: 10),
                                    //   child: Text(values['pDescriptionProject']!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                                    // ),
                                    // Align(
                                    //   alignment: Alignment.topRight,
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    //     child: Text("   اسم الجمعيه  :${values['pNameCharity']!}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    //   ),
                                    // ),
                                    //       Align(
                                    //         alignment: Alignment.topRight,
                                    //         child: Padding(
                                    //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    //           child: Text("  العنوان  :${values['pAddressCharity']!}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    //         ),
                                    //       ),
                                    //       Align(
                                    //         alignment: Alignment.topRight,
                                    //         child: Padding(
                                    //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    //           child: Text("  ${values['pEmailCharity']!}    :  البريد الاكترونى",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    //         ),
                                    //       ),
                                    //       Align(
                                    //         alignment: Alignment.topRight,
                                    //         child: Padding(
                                    //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    //           child: Text("  المستفادون  :  ${values['pBenefits']!}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    //         ),
                                    //       ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20,),
                          );
                    }
                  })
 */