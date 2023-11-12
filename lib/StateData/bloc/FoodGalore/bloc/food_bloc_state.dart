part of 'food_bloc_bloc.dart';

sealed class FoodBlocState extends Equatable {
  const FoodBlocState();
  
  @override
  List<Object> get props => [];
}

final class FoodBlocInitial extends FoodBlocState {}
