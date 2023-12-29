import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hla/StateData/bloc/ApiClient.dart';
import 'package:http/http.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'passwordreset_state.dart';

class PasswordresetCubit extends Cubit<PasswordresetState> {
  PasswordresetCubit()
      : super(PasswordresetInitial(currentstate: ButtonState.idle));
  TextEditingController inputedvalue = TextEditingController();
  TextEditingController resetinput = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmnewPassword = TextEditingController();
  String? ResetID;
  ApiClient api = ApiClient();
  late Response response;
  void validateresponse() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(inputedvalue.text);
    emit(PasswordresetLoading(currentstate: ButtonState.loading));
    if (emailValid) {
      if (await hasBeenSent('Email')) {
        emit(PasswordresetSuccess(currentstate: ButtonState.success));
      } else {
        emit(PasswordresetError(currentstate: ButtonState.fail));
      }
    } else {
      if (await hasBeenSent('StudentID')) {
        emit(PasswordresetSuccess(currentstate: ButtonState.success));
      } else {
        emit(PasswordresetError(currentstate: ButtonState.fail));
      }
    }
  }

  Future<bool> hasvalidated() async {
    bool responsebybool = false;
    response = await api.tokenValidator(resetinput.text);
    if (response.statusCode == 200) {
      responsebybool = true;
    } else if (response.statusCode == 404) {
      responsebybool = false;
    }
    print(resetinput.text);
    return responsebybool;
  }

  void validatetoken() async {
    if (resetinput.text != "") {
      if (await hasvalidated()) {
        emit(PasswordresetSuccess(currentstate: ButtonState.success));
        emit(TokenSuccess(currentstate: ButtonState.success));
      } else {
        emit(PasswordresetError(currentstate: ButtonState.fail));
      }
    }
  }

  Future<bool> hasBeenSent(String type) async {
    bool responsebybool = false;
    switch (type) {
      case 'Email':
        response = await api.resetbyEmail(inputedvalue.text);
        if (response.statusCode == 200) {
          responsebybool = true;
          final data = jsonDecode(response.body);
          var prefs = await SharedPreferences.getInstance();
          ResetID = data['StudentID'];
          prefs.setString('ResetID', data['StudentID']);
        } else if (response.statusCode == 404) {
          responsebybool = false;
        }
        break;
      case 'StudentID':
        response = await api.resetbyStudentID(inputedvalue.text);
        if (response.statusCode == 200) {
          responsebybool = true;
          final data = jsonDecode(response.body);
          var prefs = await SharedPreferences.getInstance();
          ResetID = data['StudentID'];
          prefs.setString('ResetID', data['StudentID']);
        } else if (response.statusCode == 404) {
          responsebybool = false;
        }
    }
    print(inputedvalue.text);
    return responsebybool;
  }

  void validatingPassword() async {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (newPassword.text.isEmpty) {
      emit(PasswordConfirmationFailed(
          currentstate: ButtonState.fail,
          errormessage: "Please enter the password",
          box: 1));
    }
    if (confirmnewPassword.text.isEmpty) {
      emit(PasswordConfirmationFailed(
          currentstate: ButtonState.fail,
          errormessage:
              "The Password youve entered does not match the new password",
          box: 2));
    }
    if (!regex.hasMatch(newPassword.text)) {
      emit(PasswordConfirmationFailed(
          currentstate: ButtonState.fail,
          errormessage:
              "Please enter a password thats atleast 8 characters long with 1 number, 1 special character,1 lower case character and one upper case character",
          box: 1));
      emit(PasswordresetInitial(currentstate: ButtonState.idle));
    } else {
      if (confirmnewPassword.text == newPassword.text) {
        emit(PasswordresetLoading(currentstate: ButtonState.loading));
        if (await passwordreset()) {
          emit(PasswordresetSuccess(currentstate: ButtonState.success));
        }
      }
    }
  }

  Future<bool> passwordreset() async {
    bool responsebybool = false;
    var pref = await SharedPreferences.getInstance();
    print(ResetID);
    String StudentID = pref.getString("ResetID")!;
    final response =
        await api.userUpdatePassword(StudentID, newPassword.text);
    if (response.statusCode == 200) {
      responsebybool = true;
    }
    return responsebybool;
  }

  void stateReset() {
    emit(PasswordresetInitial(currentstate: ButtonState.idle));
  }
}
