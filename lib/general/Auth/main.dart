import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hla/StateData/bloc/Authentication/auth_cubit.dart';
import 'package:hla/general/Auth/login.dart';
import 'package:hla/general/Auth/signup.dart';
import 'package:hla/general/Parent.dart';
import 'package:hla/general/routes.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class MainAuth extends StatefulWidget {
  const MainAuth({super.key});

  @override
  State<MainAuth> createState() => _MainAuthState();
}

class _MainAuthState extends State<MainAuth> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthCubit()..init(),
        child: Scaffold(
          body: TabArea(),
        ),
      ),
      onGenerateRoute: RoutesGenerator,
    );
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
  @override
  void initState() {
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
    return Scaffold(
        body: Column(children: [
      StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
               WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Parent()));});
            }
            return Text("");
          }),
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
              child: SingleChildScrollView(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 16),
                                  child: TextFormField(
                                    //controller: _model.emailAddressController,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'StudentID or Email',
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
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF4B39EF),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
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
                                    /* validator: _model.emailAddressControllerValidator
                      .asValidator(context), */
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 16),
                                  child: TextFormField(
                                    //  controller: _model.passwordController,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    //  obscureText: !_model.passwordVisibility,
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
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF4B39EF),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
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
                                    /* validator: _model.passwordControllerValidator
                      .asValidator(context), */
                                  ),
                                ),
                                BlocBuilder<AuthCubit, AuthState>(
                                    builder: (context, state) {
                                  if (state.ButtionState ==
                                      ButtonState.success) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Parent()));
                                    });
                                  }
                                  return Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: ProgressButton.icon(
                                              iconedButtons: {
                                                ButtonState.idle: IconedButton(
                                                    text: "Send",
                                                    icon: Icon(Icons.send,
                                                        color: Colors.white),
                                                    color: Colors
                                                        .deepPurple.shade500),
                                                ButtonState.loading:
                                                    IconedButton(
                                                        text: "Loading",
                                                        color: Colors.deepPurple
                                                            .shade700),
                                                ButtonState.fail: IconedButton(
                                                    text: "Failed",
                                                    icon: Icon(Icons.cancel,
                                                        color: Colors.white),
                                                    color: Colors.red.shade300),
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
                                              onPressed: () {
                                                CurrentContext.stateprogress();

                                                //CurrentContext.stateprogress();

                                                print("${state.ButtionState}");
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                      BorderRadius.circular(16),
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
                                    InkWell(
                                        onTap: () {},
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
                              ]))))),
          Card(
            margin: EdgeInsets.all(16.0),
            child: Signup(),
          )
        ],
      ))
    ]));
  }
}
