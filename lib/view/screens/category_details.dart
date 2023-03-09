
import 'package:flutter/material.dart';
import 'package:flutter_dema_app/model/category_model.dart';
import 'dart:developer';
import 'package:my_fatoorah/my_fatoorah.dart';
class CategoryItemDetails extends StatefulWidget {
  static const route = '/detail';
  final CategoryModel categoryModel;
  const CategoryItemDetails({Key? key,required this.categoryModel}) : super(key: key);

  @override
  State<CategoryItemDetails> createState() => _CategoryItemDetailsState();
}

class _CategoryItemDetailsState extends State<CategoryItemDetails> {
  int selectedPrice=1;
// int selectedPeriodic=5;
  int selectedPeriodic =1;
//  List<int>periodicList=[];
  var periodicList =List<int>.generate(100, (i) => i + 1);
  var priceList =List<int>.generate(1000, (i) => i + 1);
  List<String>statusPeriodic=['يوم','شهر','سنة'];
  String selectedPeriodicTime='يوم';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('${widget.categoryModel.nameProject}',style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin:const EdgeInsets.all(10),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              widget.categoryModel.image.toString(),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Container(
               width: 350,
               decoration:  BoxDecoration(
                 color: Colors.teal,
                 borderRadius: BorderRadius.circular(30),

               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   IconButton(
                       onPressed: (){
                         setState(() {
                           selectedPrice--;
                         });
                       },
                       icon: const Icon(Icons.remove_circle,color: Colors.black,size: 30,)
                   ),
                   const SizedBox(width: 30,),
                   Text('SAR $selectedPrice مبلغ التبرع ',style: const TextStyle(color: Colors.black,fontSize: 25,),),
                   const SizedBox(width: 30,),
                   IconButton(
                       onPressed: (){
                         setState(() {
                           selectedPrice++;
                         });
                       },
                       icon: const Icon(Icons.add_circle,color: Colors.black,size: 30,)
                   ),

                 ],
               ),
             ),
              const SizedBox(height: 20,),
               Container(
                 width: 350,
                 decoration:  BoxDecoration(
                   color: Colors.teal,
                   borderRadius: BorderRadius.circular(30),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                      // value: selectedPeriodic,
                        items: statusPeriodic.map((status) {
                          return DropdownMenuItem(
                            value: (status),
                            child: Text(status),
                          );
                        }).toList(),
                        onChanged: (value){
                          setState(() {
                            selectedPeriodicTime=value.toString();
                          });
                        }
                    ),
                    const SizedBox(width: 20,),
                    Text(selectedPeriodicTime,style: const TextStyle(color: Colors.black,fontSize: 25,),),
                    const SizedBox(width: 20,),
                    DropdownButton(
                      // value: selectedPeriodic,
                        items: periodicList.map((periodic) {
                          return DropdownMenuItem(
                            value: (periodic),
                            child: Text(periodic.toString(),style: const TextStyle(color: Colors.black,fontSize: 25,),),
                          );
                        }).toList(),
                        value: selectedPeriodic,
                        onChanged: (int? value){
                          setState(() {
                            selectedPeriodic=value! ;
                          });
                        }

                    ),
                    //Text('$periodic'),
                    const Text('المدة',style:  TextStyle(color: Colors.black,fontSize: 25,),),



                  ],
              ),
               ),
              const SizedBox(height: 50,),
              InkWell(
                onTap: ()async{
                  var response = await MyFatoorah.startPayment(
                    context: context,
                    request: MyfatoorahRequest.test(
                      currencyIso: Country.SaudiArabia,
                      successUrl: 'https://momentumacademy.net/wp-content/uploads/2020/05/Paymentsuccessful21.png',
                      //'https://www.facebook.com',
                      errorUrl: 'https://www.google.com/',
                      invoiceAmount: 100,
                      language: ApiLanguage.English,
                      //token from api token in site myfatoraa https://myfatoorah.readme.io/docs/demo-information
                      token:'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL'
                    ),
                  );
                  log(response.paymentId.toString());
                  //فى حاله الدفع
                  log(response.status.toString());
                },
                child: Container(
                  width: 220,
                  decoration:  BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text('هل تريد التبرع الأن',textAlign:TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 25,),),
                ),
              ),



            ],
          ),
        ],
      )
    );
  }
}