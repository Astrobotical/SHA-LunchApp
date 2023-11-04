import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hla/StateData/bloc/Authentication/auth_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cubitobj = context.read<AuthCubit>();
    String? Username;
    if (FirebaseAuth.instance.currentUser!.displayName!.isNotEmpty) {
      String? raw = FirebaseAuth.instance.currentUser!.displayName;
      List<String>? presplit = raw?.split(" ");
      Username = "${presplit![0]}. ${presplit![1][0]}";
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
  }
}
