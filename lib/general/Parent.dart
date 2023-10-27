import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hla/general/HomePage.dart';
import 'package:hla/general/FoodGalore/mainCatalog.dart';

class Parent extends StatefulWidget {
  Parent({super.key});

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  final List<Widget> _StudentOptions = [
    HomePage(),
    FoodCatalog(),
    const Text("Active Menu"),
    const Text("Cart"),
    const Text("Settings"),
    const Text("Logout"),
  ];

  final List<Widget> _CooksOptions = [
    const Text("Home"),
    const Text("Active Menu"),
    const Text("Settings"),
  ];
  int currentIndex = 0;
  bool isStudent = true;

  MaterialColor BGC = Colors.green;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: BGC,
            body: SingleChildScrollView(
                child: isStudent
                    ? _StudentOptions[currentIndex]
                    : _CooksOptions[currentIndex]),
            bottomNavigationBar: isStudent
                ? CurvedNavigationBar(
                    backgroundColor: BGC,
                    items: <Widget>[
                      Icon(Icons.home_outlined, size: 30),
                      Icon(Icons.menu_book_rounded, size: 30),
                      badges.Badge(
                        position:
                            badges.BadgePosition.topEnd(top: -10, end: -12),
                        showBadge: true,
                        ignorePointer: false,
                        onTap: () {},
                        badgeContent:
                            Text('1', style: TextStyle(color: Colors.white)),
                        badgeAnimation: badges.BadgeAnimation.rotation(
                          animationDuration: Duration(seconds: 1),
                          colorChangeAnimationDuration: Duration(seconds: 1),
                          loopAnimation: false,
                          curve: Curves.fastOutSlowIn,
                          colorChangeAnimationCurve: Curves.easeInCubic,
                        ),
                        badgeStyle: badges.BadgeStyle(
                          shape: badges.BadgeShape.circle,
                          badgeColor: Colors.blue,
                          padding: EdgeInsets.all(5),
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 235, 1, 1),
                              width: 2),
                          badgeGradient: badges.BadgeGradient.linear(
                            colors: [Colors.blue, Colors.yellow],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          elevation: 0,
                        ),
                        child: Icon(Icons.shopping_cart_outlined, size: 30),
                      ),
                      Icon(Icons.settings, size: 30),
                      Icon(Icons.logout_outlined, size: 30)
                    ],
                    onTap: (value) {
                      switch (value) {
                        case 0:
                          setState(() {
                            BGC = Colors.green;
                            currentIndex = 0;
                          });
                          break;
                        case 1:
                          setState(() {
                            BGC = Colors.amber;
                            currentIndex = 1;
                          });
                          print("Active Menu");
                          break;
                        case 2:
                          setState(() {
                            BGC = Colors.purple;
                            currentIndex = 2;
                          });
                          print("Categories");
                          break;
                        case 3:
                          setState(() {
                            BGC = Colors.blue;
                            currentIndex = 3;
                          });
                          print("Settings");
                          break;
                        case 4:
                          setState(() {
                            BGC = Colors.red;
                            currentIndex = 4;
                          });
                          print("Logout");
                          break;
                      }
                    },
                  )
                : CurvedNavigationBar(
                    items: const <Widget>[
                        Icon(Icons.home, size: 30),
                        Icon(Icons.menu_book, size: 30),
                        Icon(Icons.category_outlined, size: 30),
                        Icon(Icons.settings, size: 30),
                      ],
                    onTap: (value) {
                      switch (value) {
                        case 0:
                          setState(() {
                            BGC = Colors.green;
                          });
                          break;
                        case 1:
                          setState(() {
                            BGC = Colors.amber;
                          });
                          print("Active Menu");
                          break;
                        case 2:
                          setState(() {
                            BGC = Colors.purple;
                          });
                          print("Categories");
                          break;
                        case 3:
                          setState(() {
                            BGC = Colors.blue;
                          });
                          print("Settings");
                          break;
                      }
                    })));
  }
}
