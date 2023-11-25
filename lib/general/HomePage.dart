import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hla/StateData/bloc/Authentication/auth_cubit.dart';
import 'package:hla/general/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AuthCubit CurrentContext;
  String? AuthType = "something";
  String? raw;
  String? Username;
  void initState() {
    _loadCounter();
    super.initState();

  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      raw = prefs.getString("Name");
      if (raw != null) {
        List<String>? presplit = raw?.split(" ");
        Username = "${presplit![0]} .${presplit![1][0]}";
      }else if(FirebaseAuth.instance.currentUser!.displayName!.isNotEmpty){
        String? Name = FirebaseAuth.instance.currentUser!.displayName;
        prefs.setString("Name", Name!);
        raw = Name!;
        List<String>? presplit = raw?.split(" ");
        Username = "${presplit![0]} .${presplit![1][0]}";
      }/*
      Future.delayed(const Duration(seconds: 1), () async {
        AuthType = await PreferenceHelper.getValueByKey(key: "AuthType");
        switch (AuthType) {
          case "Google":
            if (FirebaseAuth.instance.currentUser!.displayName!.isNotEmpty) {
              setState(() {
                raw = FirebaseAuth.instance.currentUser!.displayName;
                List<String>? presplit = raw?.split(" ");
                Username = "${presplit![0]} .${presplit![1][0]}";
              });
            }
            break;
          case "Apple":
            break;
          case "Api":
            break;
        }
      });
      */
    });
  }

  @override
  Widget build(BuildContext context) {
    final Cubitobj = context.read<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {

      return Stack(
        children: [
          Container(
              child: Image.asset(
            'assets/logos/homescreenbackground.webp',
            height: MediaQuery.sizeOf(context).height,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          )),
          Align(
              alignment: Alignment.topRight,
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: 
                  Column(
                    mainAxisAlignment:MainAxisAlignment.end,
                    children: [
                      Gap(40),
                      Text(
                    'Welcome Back',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${Username}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Gap(10),
                  Text(
                    'Pick your meal  at ease!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )
                  )
                  ,
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: (){

                    }, child: 
                    const Text("ORDER NOW",style: TextStyle(color: Colors.black,fontSize: 18),)
                    )
                    ],
                  )
              )
          )
                  
        ],
      );
    });
  }
}
