import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../general/Parent.dart';
import 'package:lottie/lottie.dart';
class FoodStatus extends StatefulWidget {
  const FoodStatus({super.key});

  @override
  State<FoodStatus> createState() => _FoodStatusState();
}

class _FoodStatusState extends State<FoodStatus> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => Parent()
                  )
                  );
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30,
                  ),
                  ),
                  actions: [],
          title: Text(
            'Menu Status',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.normal,
            ),
          ),
          centerTitle: true,
                  elevation: 0,
                  ),
        body:SingleChildScrollView(
          child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 400,
                width: MediaQuery.sizeOf(context).width,
                child: Lottie.asset('assets/logos/breakfastanimation.json'),
                ),
              Gap(20),
              Align(
                alignment: Alignment.center,
                child:
              FittedBox(
                fit: BoxFit.fitWidth,
                child:
              Text(
                "Food Status",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
              )
              ),
              ),
              Gap(20),
              Container(
                  alignment: Alignment.center,
                  child: Text("Order Details", style: TextStyle(fontSize:22,color:Colors.white)
                  )
              ),
              Gap(30),
              Container(
                margin: EdgeInsets.only(left: 40),
                child:
                  Text("Menu Type : Breakfast",
                  style:TextStyle(fontSize: 22,color:Colors.white)
                  )
              ),
              Gap(10),
              Container(
                margin: EdgeInsets.only(left: 40) ,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text('Food - Eggs and Bread',style: TextStyle(fontSize: 22,color:Colors.white)),
                    Gap(10),
                    Text('Side - Fried Dumpling',style: TextStyle(fontSize: 22,color:Colors.white))
                  ],
                ),
              )
            ]
            )
            
          )
      );
  }
}