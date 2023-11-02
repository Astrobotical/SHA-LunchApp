import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hla/StateData/bloc/Authentication/auth_cubit.dart';
import 'package:hla/StateData/bloc/Authentication/auth_state.dart';
import 'package:hla/general/Auth/login.dart';
import 'package:hla/general/Auth/signup.dart';
import 'package:hla/general/routes.dart';
class MainAuth extends StatefulWidget{
  const MainAuth({super.key});

  @override
  State<MainAuth> createState() => _MainAuthState();
}

class _MainAuthState extends State<MainAuth> {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:BlocProvider(
        create: (context) => AuthCubit()..init(),
        child: Scaffold(
            body: TabArea(),
      ),
      ),
      onGenerateRoute:  RoutesGenerator,
    );
  }
}
class TabArea extends StatefulWidget{
  const TabArea({super.key});

  @override
  State<TabArea> createState() => _TabAreaState();
  
}

class _TabAreaState extends State<TabArea> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
            children:[
              Container(
                height: 200,
                child: Card(
                    child:
                    Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children : [
                        Center(
                            child: Text("Stony Hill Campus",
                              style: TextStyle(fontSize: 25),)
                        ),
                        Center(
                            child: Text("Lunch App",
                              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))
                        ),
                      ]
                ),
              ),
              ),
              DefaultTabController(
                initialIndex: 1,
                length: 2,
                child: TabBar(
                          controller: _tabController,

                          tabs:   <Widget>[
                            Tab(child:Text('Sign in',style: TextStyle(color: Colors.black, fontSize: 15))),
                            Tab(child:Text('Sign up',style: TextStyle(color: Colors.black,fontSize: 15))),
                          ]),
                    ),
      Expanded(child: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Card(
              margin: EdgeInsets.all(16.0),
              child: LoginWidget(),
          ),
          Card(
              margin: EdgeInsets.all(16.0),
              child:  Signup(),
              )
        ],
      ))
    ])
    );
  }
}