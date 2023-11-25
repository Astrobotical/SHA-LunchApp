import 'package:flutter/material.dart';

import '../general/Parent.dart';

class FoodStatus extends StatefulWidget {
  const FoodStatus({super.key});

  @override
  State<FoodStatus> createState() => _FoodStatusState();
}

class _FoodStatusState extends State<FoodStatus> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  centerTitle: true,
                  elevation: 0,
                  ),
        body:SingleChildScrollView(
          child:Column(
            children: []
            )
            
          )
      );
  }
}