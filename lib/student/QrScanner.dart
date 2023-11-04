import 'package:flutter/material.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar:AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          leading: IconButton(
                onPressed: () {
                   Navigator.pushNamed(context, '/');
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
      body: Column(

      ),
    );
  }
}