import 'package:flutter/material.dart';

class FoodStatus extends StatefulWidget {
  const FoodStatus({super.key});

  @override
  State<FoodStatus> createState() => _FoodStatusState();
}

class _FoodStatusState extends State<FoodStatus> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          leading: IconButton(
                onPressed: () {
                   Navigator.pop(context);
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
      )
    );
  }
}