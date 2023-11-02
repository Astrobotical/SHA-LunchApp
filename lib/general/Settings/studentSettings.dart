import 'package:flutter/material.dart';

class StudentSettings extends StatelessWidget {
  const StudentSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Column(
        
        children: [ 
          const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
          child: Text(
            'Account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
                color:Colors.white
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
            
              boxShadow: const[
BoxShadow(                  color: Colors.white
                )
              ],
              borderRadius: BorderRadius.circular(12),
              shape: BoxShape.rectangle,
            ),
            child: const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.lunch_dining,
                   color: Colors.blue,
                    size: 24,
                  ),
                  Expanded(
                    child:  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Food Status',
                        style: TextStyle( fontSize: 20,color:Colors.blue ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.90, 0.00),
                    child: Icon(
                    Icons.arrow_forward_ios, size: 18,color: Colors.blue
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
            
              boxShadow: const[
BoxShadow(                  color: Colors.white,


offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(12),
              shape: BoxShape.rectangle,
            ),
            child:const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.qr_code_2_outlined,
                   color: Colors.blue,
                    size: 24,
                  ),
                  Expanded(
                    child:  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Food Scanner',
                          style: TextStyle(
                          fontSize: 20,
                              color:Colors.blue
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.90, 0.00),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
            
              boxShadow: const[
BoxShadow(                  color: Colors.white
                )
              ],
              borderRadius: BorderRadius.circular(12),
              shape: BoxShape.rectangle,
            ),
            child: const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.receipt_long_rounded,
                   color: Colors.blue,
                    size: 24,
                  ),
                  Expanded(
                    child:  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Request Food Invoices',
                          style: TextStyle(
                          fontSize: 20,
                              color:Colors.blue
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.90, 0.00),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
            
              boxShadow: const[
BoxShadow(                  color: Colors.white,
    offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(12),
              shape: BoxShape.rectangle,
            ),
            child: const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                   color: Colors.blue,
                    size: 24,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Edit Profile',
                          style: TextStyle(
                          fontSize: 20,
                              color:Colors.blue
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.90, 0.00),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
          child: Text(
            'General',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:Colors.white
            ),
          ),
        ),
        Padding(
          padding:const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
            
              boxShadow: const[
BoxShadow(                  color: Colors.white,


offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(12),
              shape: BoxShape.rectangle,
            ),
            child: const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.help_outline_rounded,
                   color: Colors.blue,
                    size: 24,
                  ),
                  Expanded(
                    child:  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Support',
                        style: TextStyle( fontSize: 20,color:Colors.blue ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.90, 0.00),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
            
              boxShadow: const[
BoxShadow(                  color: Colors.white,


offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(12),
              shape: BoxShape.rectangle,
            ),
            child: const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: 
               Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.ios_share,
                   color: Colors.blue,
                    size: 24,
                  ),
                  Expanded(
                    child:  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Invite Friends',
                        style: TextStyle( fontSize: 20,color:Colors.blue ),
                      ),
                    ),
                  ),
             
                  Align(
                    alignment: AlignmentDirectional(0.90, 0.00),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: Container(
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
            
              boxShadow: const[
BoxShadow(                  color: Colors.white,
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(12),
              shape: BoxShape.rectangle,
            ),
            child: const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child:  Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.privacy_tip_rounded,
                   color: Colors.blue,
                    size: 24,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Terms of Service',
                        style: TextStyle( fontSize: 20,color:Colors.blue ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        )]));
  }
}