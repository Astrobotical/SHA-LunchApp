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
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      raw = prefs.getString("Name");
      if(raw != null )
      {
        List<String>? presplit = raw?.split(" ");
        Username = "${presplit![0]} .${presplit![1][0]}";
      }
      Future.delayed(const Duration(seconds: 1), () async {
        AuthType = await PreferenceHelper.getValueByKey(key: "AuthType");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Cubitobj = context.read<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        switch (AuthType) {
          case "Google":
            if (FirebaseAuth.instance.currentUser!.displayName!.isNotEmpty) {
              raw = FirebaseAuth.instance.currentUser!.displayName;
              List<String>? presplit = raw?.split(" ");
              Username = "${presplit![0]} .${presplit![1][0]}";
            }
            break;
          case "Apple":
            break;
          case "Api":
          break;
        }
        return Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          'Welcome Back ${Username}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF14181B),
                            fontSize: 28,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ))
              ],
            ));
      },
    );
  }
}
