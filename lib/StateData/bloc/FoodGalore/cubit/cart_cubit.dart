import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hla/StateData/Models/CartModel.dart';
import 'package:hla/StateData/bloc/ApiClient.dart';
import 'package:hla/StateData/bloc/DBhelper.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  DatabaseHelper DBHandle = DatabaseHelper();
  late CartModel Carthandler;
  late String MenuID;
  ApiClient api = ApiClient();
  List<CartModel> Storeditems = [];
  void startup() async {
    emit(CartStartup());
    emit(CartPopulate());
    getItems();
    setMenuID();
    emit(CartPopulateDone());
  }

  Future<List<CartModel>> getItems() async {
    final List<Map<String, Object?>> queryResult = await DBHandle.getCart();
    Storeditems = List.generate(queryResult.length, (index) {
      return CartModel.fromMap(queryResult[index]);
    });
    return Storeditems;
  }

  Future<String?> setMenuID() async {
    final pref = await SharedPreferences.getInstance();
    Response result = await api.getActiveMenu();
    if (result.statusCode == 200) {
      var fromJson = jsonDecode(result.body);
      MenuID = fromJson['ActiveMenu'];
      pref.setString("MenuID", MenuID);
    }
    return pref.getString("MenuID");
  }

  Future<void> addtoCart(CartModel stored) async {
    DBHandle.insertItem(stored.toMap());
  }
}
