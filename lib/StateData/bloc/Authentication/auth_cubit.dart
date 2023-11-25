import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  final sharedpreferencesObject = SharedPreferences.getInstance();
  GoogleSignInAccount? CurrentGoogleUser;
  GoogleSignInAccount get user => CurrentGoogleUser!;
  TextEditingController EmailBox = TextEditingController();
  TextEditingController Password = TextEditingController();
  Future<void> userApiRegister() async{
    emit(AuthLoading(ButtionState: ButtonState.loading, AuthType: "null"));
    AuthType = "Api";

  }
  Future<void> userApiLogin() async {
    emit(AuthLoading(ButtionState: ButtonState.loading, AuthType: "null"));
    AuthType = "Api";
    Response result = await api.userLogin(EmailBox.text, Password.text);
    if (result.statusCode == 200) {
      emit(AuthSuccessState(
          ButtionState: ButtonState.success, AuthType: AuthType));
      var retrievedJsonrendered = jsonDecode(result.body);
      final Data = retrievedJsonrendered;
      PreferenceHelper.saveCredentials(
          name: Data['Name'],
          isStudent: Data['Status'] != 'Cook' ? true : false,
          id: Data["StudentID"].toString(),
          Email: Data['Email']);
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
  void canRegister() async{
    print("Was preseed");
    if (EmailBox.text.isEmpty) {
      emit(AuthErrorState("The Student ID Box can't be empty"));
      return;
    }else if (Password.text.isEmpty) {
      emit(AuthErrorState("Password Box can't be empty "));
      return;
    }else{
      emit(AuthRegisterContinue(ButtionState: ButtonState.loading, AuthType: "null"));
    }
  }
  Future<void> initialize() async {
    emit(AuthInitial(ButtionState: ButtonState.idle, AuthType: "null"));
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthRefreshState(ButtionState: ButtonState.idle, AuthType: "null"));
    AuthChecker();
  }

  Future appleLogin() async {
    final appleProvider = AppleAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(appleProvider);
  }

  Future<void> userChecker(String email) async {
    var prefs = await sharedpreferencesObject;
    Response result = await api.accountPresent(email);
    if (result.statusCode == 200) {
      final body = jsonDecode(result.body);
      prefs.setString("Email", body['UserEmail']);
      prefs.setString("ID", body["UserStudentID"].toString());
      bool Student = body['UserRole'] != 'Cook' ? true : false;
      prefs.setBool('isStudent',Student);
    }
  }

  Future<void> AuthChecker() async {
    final validateinstance = await SharedPreferences.getInstance();
    String? ID = validateinstance.getString("ID");
    print(ID);
    if (ID != null) {
      emit(AuthSuccessState(
          ButtionState: ButtonState.success, AuthType: "null"));
    }
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
    await FirebaseAuth.instance.signInWithCredential(creds);
  }

  Future googleLogout() async {
    FirebaseAuth.instance.signOut();
  }

  Future logout() async {
    final preferences = await SharedPreferences.getInstance();
    String? getAuthtype = preferences.getString("AuthType");
    preferences.remove("ID");
    switch (getAuthtype) {
      case "Apple":
        preferences.clear();
        await appleLogin();
        break;
      case "Google":
        preferences.clear();
        googleLogout();
        break;
      case "Api":
        preferences.clear();
        await userLogin();
        break;
    }
  }
  void CustomAuth(String authtType)async {
    switch(authtType){
      case 'Login':
        await userLogin();
        break;
      case 'Registration':
        break;
    }
  }
  Future<void> Authenticateuser(String type) async {
    PreferenceHelper.setAuthType(auth: type);
    switch (type) {
      case "Apple":
        await appleLogin();
        break;
      case "Google":
        googleLogin();
        break;
      case "Api":
        await userLogin();
        break;
    }
  }

  Future<void> checker() async {
    statesucess();
    stateprogress();
  }
  void statesucess() {
    emit(AuthSuccessState(
        ButtionState: ButtonState.success, AuthType: AuthType));
  }

  Future<void> stateprogress() async {
    emit(AuthLoading(
        ButtionState: ButtonState.loading,
        AuthType: "null"));
  }

  void statefail() {
    emit(AuthState(
        ButtionState: ButtonState.fail, AuthType: "null"));
  }
}
