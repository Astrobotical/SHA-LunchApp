import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hidable/hidable.dart';
import 'package:hla/StateData/bloc/Authentication/auth_cubit.dart';
import 'package:hla/StateData/bloc/parent_cubit.dart';
import 'package:hla/general/Auth/main.dart';
import 'package:hla/general/routes.dart';
import 'package:hla/general/settings.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hla/general/HomePage.dart';
import 'package:hla/general/FoodGalore/mainCatalog.dart';
import 'package:hla/general/Settings/cooksSettings.dart';
import 'package:hla/general/sharedpref.dart';
import 'package:hla/student/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Parent extends StatefulWidget {
  Parent({super.key});

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return const ParentBody();
  }
}

class ParentBody extends StatefulWidget {
  const ParentBody({super.key});

  @override
  State<ParentBody> createState() => _ParentBodyState();
}

class _ParentBodyState extends State<ParentBody> {
  late bool? isStudent;
  bool isStudentSetter = true;
  late AuthCubit methodobj;
  void initState() {
    methodobj = BlocProvider.of<AuthCubit>(context);
    _ifLoggedin();
    super.initState();
  }
  _ifLoggedin() async{
    final prefs = await SharedPreferences.getInstance();
    if (FirebaseAuth.instance.currentUser?.displayName != null) {
      String? useremail = FirebaseAuth.instance.currentUser?.email;
       await methodobj.userChecker(useremail!);
    }
    setState(() {isStudentSetter = prefs.getBool("isStudent")!;});
  }
  final List<Widget> _StudentOptions = [
    HomePage(),
    FoodCatalog(),
    Cart(),
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

  bool isCartEmpty = true;
  Color BGC = Color.fromRGBO(104, 93, 156, 1);

  @override
  Widget build(BuildContext context) {
    final Cubitobj = context.read<AuthCubit>();
    final ParentObject = context.read<ParentCubit>();
    return Scaffold(
            backgroundColor: BGC,
            body: SingleChildScrollView(
              padding: EdgeInsets.only(top: 50),
              child: isStudentSetter
                  ? _StudentOptions[currentIndex]
                  : _CooksOptions[currentIndex],
            ),
            bottomNavigationBar: Hidable(
              controller: ParentObject.scrollController,
                 child:
            isStudentSetter
                ? CurvedNavigationBar(
                    backgroundColor: BGC,
                    color: Color.fromRGBO(244, 244, 244, 4),
                    items: <Widget>[
                      Icon(Icons.home_outlined, size: 30),
                      Icon(Icons.fastfood_outlined, size: 30),
                      BlocBuilder<ParentCubit,ParentState>(
                        builder: (context, state) {
                          return
                            ParentObject.isCartEmpty
                                ? Icon(Icons.shopping_cart_outlined, size: 30)
                                : badges.Badge(
                              position: badges.BadgePosition.topEnd(
                                  top: -10, end: -12),
                              showBadge: true,
                              ignorePointer: false,
                              onTap: () {},
                              badgeContent: Text('${ParentObject.cartCount}',
                                  style: TextStyle(color: Colors.white)),
                              badgeAnimation: badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration:
                                Duration(seconds: 1),
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
                              child:
                              Icon(Icons.shopping_cart_outlined, size: 30),
                            );
                        }),

                      Icon(Icons.settings_outlined, size: 30),
                      Icon(Icons.logout_outlined, size: 30)
                    ],
                    onTap: (value) async {
                      switch (value) {
                        case 0:
                          setState(() {
                            BGC = Color.fromRGBO(104, 93, 156, 1);
                            currentIndex = 0;
                          });
                          break;
                        case 1:
                          setState(() {
                            BGC = Colors.blueGrey;
                            currentIndex = 1;
                          });
                          print("Active Menu");
                          break;
                        case 2:
                          setState(() {
                            BGC = Colors.white;
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
                          var prefs = await SharedPreferences.getInstance();
                          if (await prefs.clear()) {
                            Cubitobj.googleLogout();
                            Navigator.pushReplacementNamed(context, '/Auth');
                          }
                          break;
                      }
                    },
                  )
                : CurvedNavigationBar(
                    backgroundColor: BGC,
                    color: Color.fromRGBO(244, 244, 244, 3),
                    items: const <Widget>[
                      Icon(Icons.home_outlined, size: 30),
                      Icon(Icons.fastfood_outlined, size: 30),
                      Icon(Icons.build_outlined, size: 30),
                      Icon(Icons.settings_outlined, size: 30),
                      Icon(Icons.logout_outlined, size: 30)
                    ],
                    onTap: (value) async{
                      switch (value) {
                        case 0:
                          setState(() {
                            BGC = Color.fromRGBO(104, 93, 156, 1);
                            currentIndex = 0;
                          });
                          break;
                        case 1:
                          setState(() {
                            BGC = Colors.blueGrey;
                            currentIndex = 1;
                          });
                          print("Active Menu");
                          break;
                        case 2:
                          setState(() {
                            BGC = Colors.white;
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
                         var prefs = await SharedPreferences.getInstance();
                          if (await prefs.clear()) {
                            Cubitobj.googleLogout();
                            Navigator.pushReplacementNamed(context, '/Auth');
                          }
                          break;
                      }
                    })));
  }
}
