
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'fooditems_state.dart';

class FooditemsCubit extends Cubit<FooditemsState> {
  FooditemsCubit() : super(FooditemsInitial());
  /*
  Future<void> getItems() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.romarioburke.com/api/v1/catalogs'));
      if (response.statusCode == 200) {
        final extracted = jsonDecode(response.body);
        final extracteddata = extracted['data'];

      } else {
        emit(FoodError('Something went wrong'));
      }
    } catch (e) {
      emit(FoodError('Something went wrong'));
    }
  }
  */
}
