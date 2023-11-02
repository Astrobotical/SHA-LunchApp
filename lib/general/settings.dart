import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hla/general/Settings/cooksSettings.dart';
import 'package:hla/general/Settings/studentSettings.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    bool isStudent = false;
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
              ],
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
                        child: Image.network(
                          "https://img.freepik.com/free-vector/detailed-chef-logo-template_23-2148987940.jpg?w=2000",
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.cover,
                        ),
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
                        Text('Midget Unleashed',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            )),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text('Deeznutz@kitchen.com',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        isStudent ? StudentSettings() : const CooksSettings(),
      ],
    );
  }
}
