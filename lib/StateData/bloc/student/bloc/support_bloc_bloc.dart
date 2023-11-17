import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hla/StateData/bloc/ApiClient.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'support_bloc_event.dart';
part 'support_bloc_state.dart';

class SupportBlocBloc extends Bloc<SupportBlocEvent, SupportBlocState> {
  SupportBlocBloc() : super(SupportBlocInitial()) {
    on<SupportBlocEvent>((event, emit) {});
    on<Onchanged>((event, emit) {
      void iq() {}
      emit(Somethingchange());
      emit(SupportBlocInitial());
    });
    void changed() {
      Onchanged();
    }
  }
 
}
