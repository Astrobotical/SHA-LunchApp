import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hla/StateData/bloc/Authentication/auth_cubit.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
class Authbtn extends StatelessWidget {
  const Authbtn({required this.currentstate,required this.authType});
  final ButtonState currentstate;
  final String authType;

  @override
  ProgressButton build(BuildContext context) {
    final CurrentObject =  context.read<AuthCubit>();
    return ProgressButton.icon(
        iconedButtons: {
          ButtonState.idle: IconedButton(
              text: "Register",
              icon: Icon(Icons.send,
                  color: Colors.white),
              color:
              Colors.deepPurple.shade500),
          ButtonState.loading: IconedButton(
              text: "Loading",
              color:
              Colors.deepPurple.shade700),
          ButtonState.fail: IconedButton(
              text: "Failed",
              icon: Icon(Icons.cancel,
                  color: Colors.white),
              color: Colors.red.shade300),
          ButtonState.success: IconedButton(
              text: "",
              icon: Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              color: Colors.green.shade400)
        },
        onPressed: () async {
          CurrentObject.CustomAuth(authType);
        },
        state: currentstate);
  }
}
