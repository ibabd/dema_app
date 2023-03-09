import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dema_app/provider/cart.dart';
import 'package:flutter_dema_app/view/screen2/cart_screen30.dart';
import 'package:flutter_dema_app/view/screen2/profile_screen.dart';
import 'package:flutter_dema_app/view/screen2/sign_in_user.dart';
import 'package:flutter_dema_app/view/screens/details_screen.dart';
import 'package:flutter_dema_app/view/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CollectionReference dataRef=FirebaseFirestore.instance.collection("data");
  //late Stream<QuerySnapshot> _streamCartItems;
  final CollectionReference<Map<String,dynamic>>cartItemList=FirebaseFirestore.instance.collection('cart');

  List images=[

    "assets/images/sadka3.jpg",
    "assets/images/sadka2.jpg",
    "assets/images/sadka1.jpg",
  ];
  List newsImages=[
    "assets/images/Group 2286.png",
    "assets/images/moatamer40.jpg",
    "assets/images/efftar saem1.jpg",
  ];
  final controller=CarouselController();
   int activeIndex = 0;
   int currentIndex=0;
  // final CollectionReference _collectionRef =
  // FirebaseFirestore.instance.collection("users-cart-items");
  // CollectionReference firestore=FirebaseFirestore.instance.collection('cart');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),

          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 38.0,bottom: 10,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("ديما",style: TextStyle(fontSize: 25,color: Colors.black87),),
                const SizedBox(width: 2,),
                Image.asset("assets/images/dema_logo.jpeg",height: 25,width: 25,)
              ],
            ),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight:Radius.circular(30),
                bottomLeft:Radius.circular(30),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0,right: 15.0,bottom: 10.0),
              child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.menu,color: Colors.green,size: 35,)
              ),
            ),
          ],
          leading: Badge(
            position: BadgePosition.topEnd(top:17, end: 1),
            badgeColor: Colors.black87,
            badgeContent:FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                .collection('users-cart-items')
                .doc(FirebaseAuth.instance.currentUser?.email)
                .collection("items")
                .get(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return Text("${snapshot.data!.docs.length}",style: const TextStyle(color: Colors.white),);
                }
                return  const Text("0",style: TextStyle(color: Colors.white),);
              },
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0,left: 15.0,bottom: 10.0),
              child: Consumer<Cart>(
                builder: (context, cartInstance, child){
                  return  IconButton(
                    icon: const Icon(Icons.shopping_cart,color: Colors.green,size: 35,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  const CartScreen()));
                    },
                  );
                }
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:130),
        child: SingleChildScrollView(
          child: Column(
             mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 15,right: 27,left: 27),
                child: CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder: (context,index,realIndex){
                      final urlImage=images[index];
                      return buildImage(urlImage,index);
                    },
                    options: CarouselOptions(
                      initialPage: 0,
                      height: 105,

                      autoPlay: true,
                      enlargeCenterPage: true,
                        reverse: true,
                        viewportFraction: 0.8,
                      autoPlayInterval: const Duration(seconds:4),
                     // viewportFraction: 1,
                      onPageChanged: (index,reason){
                        setState(() {
                          activeIndex=index;
                        });
                      }
                    ),
                ),
              ),
              const SizedBox(height: 17,),
              buildIndicator(),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.arrow_back,color:Colors.black26),
                        Text("جميع الأخبار",style: TextStyle(fontSize: 16,color: Colors.black26),),

                      ],
                    ),
                    const Text("أخر الأخبار ",style: TextStyle(color: Colors.green,fontSize: 23,fontWeight: FontWeight.bold),),
                    // Image.asset("assets/images/lastNew.jpg"),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              /*
              Expanded(
                flex: 2,
                child: ListView.builder(
                    shrinkWrap: true,
                    //physics: ClampingScrollPhysics(),
                   // physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: newsImages.length,
                    itemBuilder: (context,index){
                      final urlImages=newsImages[index];
                      return buildImage(urlImages,index);
                    }
                ),
              ),
        */
              CarouselSlider.builder(
                itemCount: newsImages.length,
                itemBuilder: (context,index,realIndex){
                  final urlImages=newsImages[index];
                  return buildImage(urlImages,index);
                },
                options: CarouselOptions(
                    initialPage: 0,
                    height: 121,
                    autoPlay: false,
                     enlargeCenterPage: true,
                    //reverse: true,
                   // autoPlayInterval: const Duration(seconds: 4),
                    onPageChanged: (index,reason){
                      setState(() {
                        activeIndex=index;
                      });
                    }
                ),
              ),


              const SizedBox(height:17,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Icon(Icons.arrow_back,color:Colors.black26),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                            },
                            child: const Text("جميع أبواب ألخير",style: TextStyle(fontSize: 16,color: Colors.black26),)),

                      ],
                    ),
                    const Text("أبواب ألخير ",style: TextStyle(color: Colors.green,fontSize: 23,fontWeight: FontWeight.bold),),

                    // Image.asset("assets/images/lastNew.jpg"),
                  ],
                ),
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
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
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
                          child: GridTile(
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(right: 8,left: 8,bottom: 8),
                             // padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                image:  DecorationImage(
                                  image:NetworkImage( snapshot.data!.docs[index]["pImage"]),
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
                          ),
                        );
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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), ),
        child: BottomNavigationBar(
          backgroundColor:Colors.white,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items:   [
             BottomNavigationBarItem(

              icon: InkWell(
                onTap: (){
                  _modalBottomSheetSettings();
                },
                child: const Icon(
                  Icons.settings,
                  color:Colors.grey,
                ),
              ),
              label: '',
            ),
             BottomNavigationBarItem(
              activeIcon: const Icon(
                  Icons.person,
                  color:Colors.green,
              ),
              icon: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileScreen()));
                },
                child: const Icon(
                    Icons.person,
                    color:Colors.grey
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(
                  Icons.search,
                  color:Colors.green,
              ),
              icon: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                },
                child: const Icon(
                  Icons.search,
                  color:Colors.grey,
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                // color:Colors.green,
              ),
              icon: Icon(
                Icons.home,
                color:Colors.green,
              ),
              label: '',
            ),
          ],
          onTap: (index){
           // MainController.instance.currentIndex.value=index;
          },
        ),
      ),
    );
  }

  Widget buildImage(urlImage, int index) {
    return Container(
      height: 121,
      width: double.infinity,
       margin: const EdgeInsets.symmetric(horizontal:12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          image:  DecorationImage(
            image:  AssetImage(urlImage),
            fit: BoxFit.fitWidth,
          )
      ),

      // decoration: BoxDecoration(
      //   color: Colors.grey,
      //   borderRadius: BorderRadius.circular(30),
      // ),
      // child: Image.asset(urlImage,fit: BoxFit.fill,),

    );
  }
  Widget buildImagesNew(urlImage, int index) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal:12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image:  DecorationImage(
            image:  AssetImage(urlImage),
            fit: BoxFit.fitWidth,
          )
      ),

      // decoration: BoxDecoration(
      //   color: Colors.grey,
      //   borderRadius: BorderRadius.circular(30),
      // ),
      // child: Image.asset(urlImage,fit: BoxFit.fill,),

    );
  }

  buildIndicator() {
    return AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
      effect: const SlideEffect(
        dotHeight: 20,
        dotWidth: 20,
        activeDotColor: Colors.green,
        dotColor: Colors.greenAccent

      ),
    );
  }
  _modalBottomSheetSettings() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (builder) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: 350.0,
                color: Colors.transparent,
                //could change this to Color(0xFF737373),
                //so you don't have to change MaterialApp canvasColor
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 30.0, right: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  size: 30,
                                  color: Colors.black54,
                                ),
                              ),
                              const Text(
                                "ألأعدادات",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        const ListTile(
                          leading: Icon(Icons.language,color: Colors.black54,),
                          trailing: Text("للغه",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),),
                        ),
                        const SizedBox(height: 20,),
                         ListTile(
                          leading: InkWell(
                              onTap: ()async{
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainScreen()));
                                await FirebaseAuth.instance.signOut();
                                if (!mounted) return;
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return const SignInUser();
                                    }));
                              },
                              child: const Icon(Icons.logout,color: Colors.black54,)),
                              trailing: const Text("تسجيل الخروج",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),),
                        ),
                      ] ),
                ),
              );
            });},
    );
  }
}
