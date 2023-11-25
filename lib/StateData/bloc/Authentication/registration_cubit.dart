import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hla/StateData/bloc/ApiClient.dart';
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

  Future<void> isUserRegistered() async {
    String email = emailController.text;
    Response result = await api.accountPresent(email);
    if(result.statusCode == 200){
      emit(RegistrationAccountExists(buttonState: ButtonState.fail));
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
      await this.isUserRegistered();
      }else{
        emit(RegistrationFailure(error: "Please enter the email in the correct format", buttonState: ButtonState.fail));
      }
    }
  }
}
