import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.only(top: 20),
      child:Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
        child: Column(children: [
        const Text('Welcome Back Romario',
        textAlign: TextAlign.start,
                    style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF14181B),
                          fontSize: 28,
                          fontWeight: FontWeight.normal,
                        ),),
                
              
      ],
    ))],
    ));
  }
}
