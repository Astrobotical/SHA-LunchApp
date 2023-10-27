import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hla/StateData/Models/MenuItemModel.dart';
import 'package:http/http.dart'as http;
part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());
 late List<MenuItemModel> Items;
  Future<void> getFood() async {
    /*
    try {
      final response = await http.get(Uri.parse(
          'https://hla-backend.herokuapp.com/api/v1/menu/'));
      if (response.statusCode == 200) {
        Items = menuItemModelFromJson(response.body);
        emit(FoodLoaded(food));
      } else {
        emit(FoodError('Something went wrong'));
      }
    } catch (e) {
      emit(FoodError('Something went wrong'));
    }
    */
  }

}
