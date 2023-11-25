import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hla/general/Settings/cooksSettings.dart';
import 'package:hla/general/Settings/studentSettings.dart';
import 'package:hla/general/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool? isStudent;
  bool isStudentSetter = false;
  String? AuthType = "something";
  String? raw;
  String? Username;
  String? Email = "Yes";
  bool isImageSet = false;

  void initState() {
    _loadCounter();
    super.initState();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      Username = prefs.getString("Name");
      isStudent = prefs.getBool("isStudent");
      Email = prefs.getString("Email");
      isImageSet =  true;
      isStudentSetter = isStudent!;
      Future.delayed(const Duration(seconds: 1), () async {
        AuthType = await PreferenceHelper.getValueByKey(key: "AuthType");
      });
      Future.delayed(const Duration(seconds: 1), () async {
        //  Email = await PreferenceHelper.getValueByKey(key: "Email");
        Email = await PreferenceHelper.getValueByKey(key: "Email");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [],
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black45,
                        width: 5,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child:isImageSet ?
                        Image.network(
                          "https://ui-avatars.com/api/?name=${Username}",
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.cover,
                        ):
                            Image.network('https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png',
                            width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                                fit: BoxFit.cover,
                            )

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$Username",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: 
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child:Text('$Email',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        isStudentSetter ? StudentSettings() : const CooksSettings(),
      ],
    );
  }
}
