import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hla/StateData/bloc/ApiClient.dart';
import 'package:hla/general/sharedpref.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:progress_state_button/progress_button.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit()
      : super(RegistrationInitial(buttonState: ButtonState.idle));
  ApiClient api = ApiClient();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Future<void> isUserRegistered() async {
    String email = emailController.text;
    Response result = await api.accountPresent(email);
    if(result.statusCode == 200){
      emit(RegistrationAccountExists(buttonState: ButtonState.fail));
      emit(RegistrationRefresh(buttonState: ButtonState.idle));
    }else if(result.statusCode == 404){
      emit(RegistrationContinue(buttonState: ButtonState.loading));
      emit(RegistrationRefresh(buttonState: ButtonState.idle));
    }
  }

  bool validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    return value!.isEmpty || !regex.hasMatch(value) ? false : true;
  }
  Future<void> userApiLogin() async {
    emit(RegistrationLoading(buttonState: ButtonState.loading));
    Response result = await api.userLogin(emailController.text, passwordController.text);
    if (result.statusCode == 200) {
      PreferenceHelper.setAuthType(auth: 'Api');
      emit(RegistrationSuccess(buttonState: ButtonState.success));

      emit(RegistrationRefresh(buttonState: ButtonState.idle));
      var retrievedJsonrendered = jsonDecode(result.body);
      final Data = retrievedJsonrendered;
      PreferenceHelper.saveCredentials(
          name: Data['Name'],
          isStudent: Data['Status'] != 'Cook' ? true : false,
          id: Data["StudentID"].toString(),
          Email: Data['Email']);
    }
  }
   registerUser() async{
    Response results = await api.userRegistration(nameController.text, emailController.text, 'Student', studentIDController.text, passwordController.text);
    if(results.statusCode == 200){
      emit(RegistrationSuccess(buttonState: ButtonState.success));
    }else if(results.statusCode == 401) {
      final parsed = jsonDecode(results.body);
      final Data = parsed['response'];
      emit(RegistrationFailure(error: Data, buttonState: ButtonState.fail));
    }
  }
  void confirmRegistration() async{
    if(nameController.text.isEmpty)
      {
        emit(RegistrationFailure(error: "The Student ID Box can't be empty", buttonState: ButtonState.fail));
        return;
      }else if(studentIDController.text.isEmpty){
      emit(RegistrationFailure(error: "The Student ID Box can't be empty", buttonState: ButtonState.fail));
    }else{
      registerUser();
      // if(confirmPasswordController.text != passwordController.text){
     // emit(RegistrationFailure(error: "The Passwords arent the same", buttonState: ButtonState.fail));
    }
  }
  void canRegister() async {
    print("Was preseed");
    if (emailController.text.isEmpty) {
      emit(RegistrationFailure(
          error: "The Student ID Box can't be empty",
          buttonState: ButtonState.fail));
      return;
    } else if (passwordController.text.isEmpty) {
      emit(RegistrationFailure(
          error: "Password Box can't be empty ",
          buttonState: ButtonState.fail));
      return;
    } else {
      if (validateEmail(emailController.text)) {
        emit(RegistrationLoading(buttonState: ButtonState.loading));
      await isUserRegistered();
      }else{
        emit(RegistrationFailure(error: "Please enter the email in the correct format", buttonState: ButtonState.fail));
      }
    }
  }
}
