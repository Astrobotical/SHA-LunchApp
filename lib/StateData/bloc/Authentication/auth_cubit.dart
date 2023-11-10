import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hla/StateData/Models/Fooditems.dart';
import 'package:hla/StateData/Models/User.dart';
import 'package:hla/StateData/bloc/ApiClient.dart';
import 'package:hla/general/sharedpref.dart';
import 'package:http/http.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:http/http.dart' as httpobject;
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(AuthState(ButtionState: ButtonState.idle, AuthType: "null"));
  ButtonState? bstate;
  final ApiClient api = ApiClient();
  late List<Fooditems> Menuitems;
  late mainUser? loggedinuser;
  final googlesignIn = GoogleSignIn();
  String? AuthType;
  GoogleSignInAccount? CurrentGoogleUser;
  GoogleSignInAccount get user => CurrentGoogleUser!;
  TextEditingController EmailBox = TextEditingController();
  TextEditingController Password = TextEditingController();

  Future<void> userApiLogin() async {
    emit(AuthLoading(ButtionState: ButtonState.loading, AuthType: "null"));
    AuthType = "Api";
    Response result = await api.userLogin(EmailBox.text, Password.text);
    if (result.statusCode == 200) {
      emit(AuthSuccessState(
          ButtionState: ButtonState.success, AuthType: AuthType));
      var retrievedJsonrendered = jsonDecode(result.body);
      final Data = retrievedJsonrendered;
      print(Data['Name']);
      PreferenceHelper.saveCredentials(
          name: Data['Name'],
          isStudent: Data['Status'] != 'Cook' ? true : false,
          id: Data["StudentID"].toString(),
          Email: "Data['Email']");
    }
  }

  Future<void> userLogin() async {
    if (EmailBox.text.isEmpty) {
      emit(AuthErrorState("The Student ID Box can't be empty"));
      return;
    }
    if (Password.text.isEmpty) {
      emit(AuthErrorState("Password Box can't be empty "));
      return;
    }
    userApiLogin();
  }

  Future<void> initialize() async {
    emit(AuthInitial(ButtionState: ButtonState.idle, AuthType: "null"));
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthRefreshState(ButtionState: ButtonState.idle, AuthType: "null"));
  }

  Future appleLogin() async {
    final appleProvider = AppleAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(appleProvider);
  }

  Future googleLogin() async {
    final googleUser = await googlesignIn.signIn();

    if (googleUser == null) return;
    CurrentGoogleUser = googleUser;
    final googleAuth = await googleUser.authentication;
    // Creating a new Credential
    final creds = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(creds);
  }

  Future googleLogout() async {
    PreferenceHelper.clear();
    FirebaseAuth.instance.signOut();
  }

  Future<void> Authenticateuser(String type) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.setString("AuthType", type);
    PreferenceHelper.setAuthType(auth: type);
    switch (type) {
      case "Apple":
        AuthType = "Apple";
        await appleLogin();
        break;
      case "Google":
        AuthType = "Google";
        googleLogin();
        break;
      case "Api":
        AuthType = "Api";
        await userLogin();
        break;
    }
  }

  Future<void> init() async {}
  Future<void> checker() async {
    statesucess();
    stateprogress();
  }

  void statesucess() {
    emit(AuthSuccessState(
        ButtionState: ButtonState.success, AuthType: AuthType));
  }

  Future<void> stateprogress() async {
    //emit(AuthState(ButtionState: state.ButtionState = ButtonState.loading));
    emit(AuthLoading(
        ButtionState: state.ButtionState = ButtonState.loading,
        AuthType: "null"));

    //statesucess();
    // emit(AuthState(ButtionState: state.ButtionState = ButtonState.loading));
  }

  void statefail() {
    emit(AuthState(
        ButtionState: state.ButtionState = ButtonState.fail, AuthType: "null"));
  }

  void stateidle() {
    //  buttonState.add(ButtonState.idle);
  }
}
