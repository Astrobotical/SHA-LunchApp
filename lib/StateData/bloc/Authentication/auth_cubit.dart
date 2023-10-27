import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hla/StateData/bloc/Authentication/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:progress_state_button/progress_button.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(ButtionState: ButtonState.idle));
  ButtonState? bstate;
  StreamController<ButtonState> buttonState = StreamController<ButtonState>();
  final googlesignIn = GoogleSignIn();
  GoogleSignInAccount? CurrentGoogleUser;
  GoogleSignInAccount get user => CurrentGoogleUser!;
  Future googleLogin() async {
    final googleUser = await googlesignIn.signIn();
    if (googleUser == null) return;
    CurrentGoogleUser = googleUser;
    final googleAuth = await googleUser.authentication;
    final Creds = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(Creds);
  }

  late final StreamSubscription<ButtonState> buttonStateSubscription;
 /* StreamSubscription<ButtonState> _State() {
    return buttonStateSubscription =
        buttonState.stream.listen((ButtonState event) {
      if (event == ButtonState.idle) {
        emit(AuthState(ButtionState: state.ButtionState = ButtonState.idle as Stream<ButtonState>?));
      } else if (event == ButtonState.loading) {
        emit(AuthState(ButtionState: state.ButtionState = ButtonState.loading as Stream<ButtonState>?));
      } else if (event == ButtonState.success) {
        emit(AuthState(ButtionState: state.ButtionState = ButtonState.success as Stream<ButtonState>?));
      } else if (event == ButtonState.fail) {
        emit(AuthState(ButtionState: state.ButtionState = ButtonState.fail as Stream<ButtonState>?));
      }
    });
  }
*/
  Future<void> init() async {
    /*emit(state);
    bstate = ButtonState.loading;
    Buttion
    emit(bstate as AuthState);
    //await Future.delayed(const Duration(seconds: 5));
    bstate = ButtonState.success;
    emit(bstate as AuthState);

     */
  }
  Future<void> checker() async {
    statesucess();
    stateprogress();
  }

  void statesucess() {
    buttonState.add(ButtonState.success);
  }

  void stateprogress() {
    buttonState.add(ButtonState.loading);
  }

  void statefail() {
    buttonState.add(ButtonState.fail);
  }

  void stateidle() {
    buttonState.add(ButtonState.idle);
  }

  void dispose() {
    buttonState.close();
    buttonStateSubscription.cancel();
  }
/*
  void addTodo({TODO? todo}) {
    if (titleController.text.trim().isEmpty) {
      emit(HomeScreenErrorState("Title can't be empty"));
      return;
    }

    if (descriptionController.text.trim().isEmpty) {
      emit(HomeScreenErrorState("Description can't be empty"));
      return;
    }
    if (todo != null) {
      int index = todos.indexOf(todo);
      todos.removeAt(index);
      todos.insert(
          index, TODO(titleController.text, descriptionController.text));
    } else {
      todos.add(TODO(titleController.text, descriptionController.text));
    }
    emit(HomeScreenRefereshState());
  }

  void prePopulateData(TODO todo) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;
    emit(HomeScreenRefereshState());
  }

  void deleteTodo(TODO todo) {
    todos.remove(todo);
    emit(HomeScreenRefereshState());
  }

  void clearPreviousData() {
    titleController.clear();
    descriptionController.clear();
    emit(HomeScreenRefereshState());
  }

 */
}
