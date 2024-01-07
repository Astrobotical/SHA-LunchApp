import 'dart:async';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:hla/StateData/bloc/Authentication/auth_cubit.dart';
import 'package:hla/StateData/bloc/Authentication/registration_cubit.dart';
import 'package:hla/general/Auth/authbtn.dart';
import 'package:hla/general/Auth/forgetpassword/forgetpassword.dart';
import 'package:hla/general/Auth/login.dart';
import 'package:hla/general/Auth/registration.dart';
import 'package:hla/general/Auth/signup.dart';
import 'package:hla/general/Parent.dart';
import 'package:hla/general/routes.dart';
import 'package:hla/general/Auth/registration.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class MainAuth extends StatefulWidget {
  const MainAuth({super.key});

  @override
  State<MainAuth> createState() => _MainAuthState();
}

class _MainAuthState extends State<MainAuth> {
  late FToast fToast;
  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerator,
      home: Overlay(initialEntries: [
        OverlayEntry(builder: (context) {
          return MultiBlocListener(listeners: [
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccessState) {
                  // Navigator.pushReplacementNamed(context,'/');
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Parent()));
                  });
                }
              },
            ),
            BlocListener<RegistrationCubit, RegistrationState>(
                listener: (context, state) {
              if (state is RegistrationContinue) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => promptregister()));
                });
              }
              if (state is RegistrationAccountExists) {
                _showToast(true, "Account exists");
              }
              if (state is RegistrationFailure) {
                return _showToast(true, state.error);
              }
            }),
          ], child: Scaffold(body: TabArea()));
        })
      ]),
    );
  }

  _showToast(bool iserror, String message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: iserror ? Colors.red : Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iserror ? Icons.error_outline : Icons.check,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(message),
        ],
      ),
    );
    setState(() {
      fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 4),
      );
    });
  }
}

class TabArea extends StatefulWidget {
  const TabArea({super.key});

  @override
  State<TabArea> createState() => _TabAreaState();
}

class _TabAreaState extends State<TabArea> with TickerProviderStateMixin {
  late final TabController _tabController;
  late AuthCubit CurrentContext;

  ButtonState? changedstate = ButtonState.idle;
  late FToast fToast;
  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    CurrentContext = BlocProvider.of<AuthCubit>(context);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Cubitobj = context.read<AuthCubit>();
    bool isVisible = false;
    return Scaffold(
        body: Column(children: [
      Container(
        height: 200,
        child: Card(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
                child: Text(
              "Stony Hill Campus",
              style: TextStyle(fontSize: 25),
            )),
            Center(
                child: Text("Lunch App",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
          ]),
        ),
      ),
      DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: TabBar(controller: _tabController, tabs: <Widget>[
          Tab(
              child: Text('Sign in',
                  style: TextStyle(color: Colors.black, fontSize: 15))),
          Tab(
              child: Text('Sign up',
                  style: TextStyle(color: Colors.black, fontSize: 15))),
        ]),
      ),
      Expanded(
          child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Card(
              margin: EdgeInsets.all(16.0),
              child:
                  BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                if (state.ButtionState == ButtonState.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.ButtionState == ButtonState.success) {
                  Future.delayed(const Duration(seconds: 4));
                  // _showToast(false, "Login was successful");
                  // Navigator.pushNamed(context, '/');
                }
                return SingleChildScrollView(
                    child: Align(
                        alignment: AlignmentDirectional(0.00, -1.00),
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 16, 24, 0),
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 230,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    'Welcome Back',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF101213),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 24),
                                    child: Text(
                                      'Fill out the information below in order to access your account.',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF57636C),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 16),
                                    child: TextFormField(
                                      controller: Cubitobj.EmailBox,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'StudentID',
                                        labelStyle: TextStyle(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        hintStyle: const TextStyle(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0E3E7),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF4B39EF),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xCCFFFFFF),
                                      ),
                                      style: const TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF101213),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 16),
                                    child: TextFormField(
                                      controller: Cubitobj.Password,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: const TextStyle(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        hintStyle: const TextStyle(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFE0E3E7),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF4B39EF),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xCCFFFFFF),
                                        suffixIcon:

                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (isVisible) {
                                                  isVisible = false;
                                                } else {
                                                  isVisible = true;
                                                }
                                              });
                                            },
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: isVisible
                                                ?
                                                GestureDetector(
                                                  onTap: (){

                                                  },
                                                  child:
                                            Icon(
                                                    Icons.visibility_outlined,
                                                    color: Color(0xFF57636C),
                                                    size: 20,
                                                  )
                                                )
                                                :
                                            GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    isVisible;
                                                  });
                                                },
                                                child:
                                            Icon(
                                                    Icons
                                                        .visibility_off_outlined,
                                                    color: Color(0xFF57636C),
                                                    size: 20,
                                                  )),
                                        ),
                                      ),
                                      style: const TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF101213),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      obscureText: isVisible,
                                    ),
                                  ),

                                  BlocBuilder<AuthCubit, AuthState>(
                                      builder: (context, state) {
                                    if (state.ButtionState ==
                                        ButtonState.success) {}
                                    return Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 16),
                                            child: ProgressButton.icon(
                                                iconedButtons: {
                                                  ButtonState.idle:
                                                      IconedButton(
                                                          text: "Send",
                                                          icon: Icon(Icons.send,
                                                              color:
                                                                  Colors.white),
                                                          color: Colors
                                                              .deepPurple
                                                              .shade500),
                                                  ButtonState.loading:
                                                      IconedButton(
                                                          text: "Loading",
                                                          color: Colors
                                                              .deepPurple
                                                              .shade700),
                                                  ButtonState.fail:
                                                      IconedButton(
                                                          text: "Failed",
                                                          icon: Icon(
                                                              Icons.cancel,
                                                              color:
                                                                  Colors.white),
                                                          color: Colors
                                                              .red.shade300),
                                                  ButtonState.success:
                                                      IconedButton(
                                                          text: "",
                                                          icon: Icon(
                                                            Icons.check_circle,
                                                            color: Colors.white,
                                                          ),
                                                          color: Colors
                                                              .green.shade400)
                                                },
                                                onPressed: () async {
                                                  Cubitobj.userLogin();
                                                },
                                                state: state.ButtionState)));
                                  }),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 16, 12),
                                          child: Text(
                                            'Or sign in with',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                Cubitobj.Authenticateuser(
                                                    'Google');
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(20),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: Colors.grey[200]),
                                                child: Image.asset(
                                                    'assets/logos/glogo.png'),
                                                height: 90,
                                              )),
                                          const Gap(20),
                                          InkWell(
                                              onTap: () {
                                                Cubitobj.Authenticateuser(
                                                    'Apple');
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(20),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: Colors.grey[200]),
                                                child: Image.asset(
                                                    'assets/logos/apple.png'),
                                                height: 90,
                                              ))
                                        ],
                                      ),
                                      InkWell(
                                          onTap: () {
                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => forgetpassword()));
              });
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: const Text(
                                                  "Forgot Password?",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Color(0xFF101213),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  )))),
                                    ],
                                  )
                                ]))));
              })),
          Card(
              margin: EdgeInsets.all(16.0),
              child: BlocBuilder<RegistrationCubit, RegistrationState>(
                builder: (context, state) {
                  final methodObject = context.read<RegistrationCubit>();
                  if (state.buttonState == ButtonState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is RegistrationAccountExists) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _showToast(true, "Account exists");
                    });
                  }/*
                  if(state is RegistrationSuccess)
                    {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ));
                    });
                    }
                    */
                  return SingleChildScrollView(
                      child: Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 230,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      'Sigh up',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF101213),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 24),
                                      child: Text(
                                        "Let's get started by filling out the form below.",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 8, 16),
                                      child: TextFormField(
                                        controller:
                                            methodObject.emailController,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          hintStyle: const TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE0E3E7),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF4B39EF),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xCCFFFFFF),
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF101213),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 8, 16),
                                      child: TextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        controller:
                                            methodObject.passwordController,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: const TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          hintStyle: const TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE0E3E7),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF4B39EF),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xCCFFFFFF),
                                          suffixIcon: InkWell(
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              Icons.visibility_outlined,
                                              color: Color(0xFF57636C),
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF101213),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 16),
                                            child: ProgressButton.icon(
                                                iconedButtons: {
                                                  ButtonState.idle:
                                                      IconedButton(
                                                          text: "Register",
                                                          icon: Icon(Icons.send,
                                                              color:
                                                                  Colors.white),
                                                          color: Colors
                                                              .deepPurple
                                                              .shade500),
                                                  ButtonState.loading:
                                                      IconedButton(
                                                          text: "Loading",
                                                          color: Colors
                                                              .deepPurple
                                                              .shade700),
                                                  ButtonState.fail:
                                                      IconedButton(
                                                          text: "Failed",
                                                          icon: Icon(
                                                              Icons.cancel,
                                                              color:
                                                                  Colors.white),
                                                          color: Colors
                                                              .red.shade300),
                                                  ButtonState.success:
                                                      IconedButton(
                                                          text: "",
                                                          icon: Icon(
                                                            Icons.check_circle,
                                                            color: Colors.white,
                                                          ),
                                                          color: Colors
                                                              .green.shade400)
                                                },
                                                onPressed: () async {
                                                  methodObject.canRegister();
                                                },
                                                state: state.buttonState))),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 16, 12),
                                            child: Text(
                                              'Or sign in with',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF57636C),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  Cubitobj.googleLogin();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      color: Colors.grey[200]),
                                                  child: Image.asset(
                                                      'assets/logos/glogo.png'),
                                                  height: 90,
                                                )),
                                            const Gap(20),
                                            InkWell(
                                                child: Container(
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: Colors.grey[200]),
                                              child: Image.asset(
                                                  'assets/logos/apple.png'),
                                              height: 90,
                                            ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ]))));
                },
              ))
        ],
      )),
      StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, snapshot) {
            int count = 1;
            if (snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Parent()));
              });
            }
            return Text("");
          }),
    ]));
  }

  _showToast(bool iserror, String message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: iserror ? Colors.red : Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iserror ? Icons.error_outline : Icons.check,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(message),
        ],
      ),
    );
    setState(() {
      fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 4),
      );
    });
  }
}
