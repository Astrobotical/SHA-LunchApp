import 'package:flutter/material.dart';

class CooksSettings extends StatelessWidget {
  const CooksSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
        child: Text(
          'Account',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/additem');
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.library_add_outlined,
                    color: Colors.blue,
                    size: 24,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Add Menu Item',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.90, 0.00),
                    child: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
       InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/editmenuitems');
        },
        child:
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.edit_outlined,
                  color: Colors.blue,
                  size: 24,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      'Edit Menu Items',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
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
      )
      ),
      InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/menuCounter');
        },
        child:
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.control_point_outlined,
                  color: Colors.blue,
                  size: 24,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      'Menu Counter',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
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
      ),
      InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/qrcodegenerator');
        },
        child:
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: const Padding(
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
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      'Menu QR Code Designer',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
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
      ),
      InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/winvoiceRequestor');
        },
        child:
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
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
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      'Request Food Invoices',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
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
      ),
      const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
        child: Text(
          'General',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/editprofile');
        },
        child:
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
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
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      'Feedback Support',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
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
      ),
      InkWell(
        onTap: () {
          
        },
        child:
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.ios_share,
                  color: Colors.blue,
                  size: 24,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      'Invite Team Members',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
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
      ),
      InkWell(
        onTap: () {
          
        },
        child:
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
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
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                      ),
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
      )
      )
    ]);
  }
}
