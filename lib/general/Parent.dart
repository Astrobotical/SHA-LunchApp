import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hla/general/Auth/main.dart';
import 'package:hla/general/routes.dart';
import 'package:hla/general/settings.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hla/general/HomePage.dart';
import 'package:hla/general/FoodGalore/mainCatalog.dart';
import 'package:hla/general/Settings/cooksSettings.dart';

class Parent extends StatefulWidget {
  Parent({super.key});

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ParentBody(),
        onGenerateRoute: RoutesGenerator);
  }
}

class ParentBody extends StatefulWidget {
  const ParentBody({super.key});

  @override
  State<ParentBody> createState() => _ParentBodyState();
}

class _ParentBodyState extends State<ParentBody> {
  final List<Widget> _StudentOptions = [
    HomePage(),
    FoodCatalog(),
    const Text('Cart'),
    Settings(),
    const Text("Logout"),
  ];

  final List<Widget> _CooksOptions = [
    HomePage(),
    FoodCatalog(),
    const Text("Build a Menu"),
    Settings(),
    const Text("Logout"),
  ];
  int currentIndex = 0;
  bool isStudent = false;
  bool isCartEmpty = true;
  MaterialColor BGC = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BGC,
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.only(top: 50),
              child: isStudent
                  ? _StudentOptions[currentIndex]
                  : _CooksOptions[currentIndex]),
        ),
        bottomNavigationBar: isStudent
            ? CurvedNavigationBar(
                backgroundColor: BGC,
                items: <Widget>[
                  Icon(Icons.home_outlined, size: 30),
                  Icon(Icons.fastfood_outlined, size: 30),
                  isCartEmpty
                      ? Icon(Icons.shopping_cart_outlined, size: 30)
                      : badges.Badge(
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
                  Icon(Icons.settings_outlined, size: 30),
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
                        BGC = Colors.grey;
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
                      Navigator.pushReplacementNamed(context, '/Auth');
                      break;
                  }
                },
              )
            : CurvedNavigationBar(
                backgroundColor: BGC,
                items: const <Widget>[
                  Icon(Icons.home, size: 30),
                  Icon(Icons.fastfood_outlined, size: 30),
                  Icon(Icons.build_outlined, size: 30),
                  Icon(Icons.settings_outlined, size: 30),
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
                        BGC = Colors.grey;
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
                      Navigator.pushReplacementNamed(context, '/Auth');
                      break;
                  }
                }));
  }
}
