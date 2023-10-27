import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.only(top: 50),
      child:Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
        child: Column(children: [
        const Text('Welcome Back Romario',
        textAlign: TextAlign.start,
                    style: TextStyle(fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF101213),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,),),
                
              
      ],
    ))],
    ));
  }
}
