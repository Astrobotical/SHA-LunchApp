import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hla/StateData/bloc/ApiClient.dart';
import 'package:hla/StateData/bloc/student/bloc/support_bloc_bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'support_cubit_state.dart';

class SupportCubitCubit extends Cubit<SupportCubitState> {
  SupportCubitCubit() : super(SupportCubitInitial());
  TextEditingController message = TextEditingController();
  final ApiClient api = ApiClient();
  String? feedbacktype;

  Future<void> init() async {
    emit(SupportCubitInitial());
  }

  Future<void> sendFeedback(String studentID,String type) async {
    Response result =
        await api.sendFeedbacks(studentID, type, message.text);
    if (result.statusCode == 200) {
      emit(SupportCubitSuccessSent());
    } else {
      emit(SupportCubitError());
    }
  }

  void dropdownnotifier() {
    emit(SupportCubitChanged());
  }
}
