import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'food_bloc_event.dart';
part 'food_bloc_state.dart';

class FoodBlocBloc extends Bloc<FoodBlocEvent, FoodBlocState> {
  FoodBlocBloc() : super(FoodBlocInitial()) {
    on<FoodBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
