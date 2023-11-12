part of 'fooditems_cubit.dart';

sealed class FooditemsState extends Equatable {
  const FooditemsState();

  @override
  List<Object> get props => [];
}

final class FooditemsInitial extends FooditemsState {}

final class Fooditemsgetting extends FooditemsState {}

final class FooditemsLoadingdone extends FooditemsState {}

final class FooditemsUpdated extends FooditemsState {}
