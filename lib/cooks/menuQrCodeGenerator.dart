import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:intl/intl.dart';
class MenuQrGenerator extends StatefulWidget {
  const MenuQrGenerator({super.key});

  @override
  State<MenuQrGenerator> createState() => _MenuQrGeneratorState();
}

class _MenuQrGeneratorState extends State<MenuQrGenerator> {
  ScreenshotController screenshotController = ScreenshotController();
  bool ifpresent = false;
  Uint8List? image;
  String Menulink = "123";
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: Colors.blue,
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
            body: SingleChildScrollView(
              child:  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: 
                       Screenshot(
                                controller: screenshotController,
                                child:
                      Column(
                        children:[
                          Container(
                            child:FittedBox(
                              fit:BoxFit.fitWidth,
                              child:
                            Text("Stony Hill Campus Menu Signing QR", style: TextStyle(fontSize: 20, color: Colors.white),),
                          )),
                    Container(child:
                    Center(
                      child: Text("${DateFormat('EEEE, d MMM, yyyy').format(selectedDate)}", style: TextStyle(fontSize: 20, color: Colors.white),),
                    )
                    ),
                    Gap(30),
                    Container(
                        height: 280,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                          ),
                        ),
                        child: Menulink.isEmpty
                            ? Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9LzzcjbUkZmi3Rq7RRwXBgP9__dqE_6V5_Hy94hxj&s')
                            :  QrImageView(
                                  data: "https://www.google.com",
                                )
                                ),
                        ]
                      )
                       ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(20),
                          width: 150,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (Menulink.isEmpty) {
                                  SnackBar(
                                    content: Text(
                                        'Please enter the text to convert to QR a code'),
                                  );
                                } else {
                                  _shareQrCode();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                              ),
                              child: Text('Share QR')),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  _shareQrCode() async {
    final directory = (await getApplicationDocumentsDirectory()).path;
    screenshotController.capture().then((image) async {
      if (image != null) {
        try {
          String fileName = DateTime.now().microsecondsSinceEpoch.toString();
          final imagePath = await File('$directory/$fileName.png').create();
          await imagePath.writeAsBytes(image);
        await  Share.shareFiles([imagePath.path]);
                } catch (error) {}
      }
    }).catchError((onError) {
      print('Error --->> $onError');
    });
  }
}
