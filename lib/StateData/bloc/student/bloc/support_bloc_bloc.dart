import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'support_bloc_event.dart';
part 'support_bloc_state.dart';

class SupportBlocBloc extends Bloc<SupportBlocEvent, SupportBlocState> {
  SupportBlocBloc() : super(SupportBlocInitial()) {
    on<SupportBlocEvent>((event, emit) {});
    on<Onchanged>((event, emit) {
      void iq(){

      }
      emit(Somethingchange());
      emit(SupportBlocInitial());
    });
    void changed() {
      Onchanged();
    }
  }
}
