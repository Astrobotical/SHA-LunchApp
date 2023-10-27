import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ActiveMenu extends StatefulWidget {
  const ActiveMenu({super.key});
  @override
  State<ActiveMenu> createState() => _ActiveMenuState();
}

class _ActiveMenuState extends State<ActiveMenu> {
  Future<List<dynamic>> fetchMenu() async {
    final response = await http
        .get(Uri.parse('https://api.romarioburke.com/api/v1/catalogs'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Something aint write with the active menu fetch request');
    }
    return Future.value([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
              height: 30,
              child: Column(children: [
                Container(
                color: Colors.deepPurpleAccent,
                child: Flex(direction: Axis.horizontal, children: [
                  Text('idk bro'),
                    ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25)),
                        child: GestureDetector(
                            onTap: () {}, child: const Text("All"))),
                    Container(child: GestureDetector(child: Text("Breakfast"))),
                    Container(child: GestureDetector(child: Text("Lunch"))),
                    Container(child: GestureDetector(child: Text("Dinner"))),
                  ],
                )
                ]))
            /*  Container(
            child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {},
        ))
        */
          ]),
        )));
  }
}
