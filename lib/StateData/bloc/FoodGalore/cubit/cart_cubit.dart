// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:ffi';

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
  List storedIDS = [];
  void startup() async {
    emit(CartStartup());
    emit(CartPopulateDone());
    await getItems();
    await setMenuID();
  }

  Future<List<CartModel>> getItems() async {
    final List<Map<String, Object?>> queryResult = await DBHandle.getCart();
    Storeditems = List.generate(
        queryResult.length, (index) => CartModel.fromMap(queryResult[index]));
    emit(CartPopulateDone());
    print(Storeditems);
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

  Future<void> deletefromCart(int? index) async {
    int returneditem = await DBHandle.deleteItem(index);
    emit(CartPopulate());
    emit(CartPopulateDone());
  }

  deleteAll() async {
    Database db = await DBHandle.database;
    return await db.rawDelete("Delete  from BigChart");
  }

  transit() async {
    await deleteAll();
    emit(CartPopulateDone());
  }

  Future<void> checkout() async {
    final List<Map<String, Object?>> queryResult = await DBHandle.getCart();
    final List<Map<String, Object?>> data =
        List.generate(queryResult.length, (index) {
      return <String, dynamic?>{
        "MainDishID": '${queryResult[index]['FoodID']}',
        "SideDishID": '${queryResult[index]['SideID']}',
        "Category": '${queryResult[index]['FoodCategory']}'
      };
    });
    var parseddata = jsonEncode(data);
    final prefs = await SharedPreferences.getInstance();
    String? menu = prefs.getString('MenuID');
    String? StudentID = prefs.getString('ID');
    Response result = await api.cartCheckout(parseddata, menu!, StudentID!);
    if (result.statusCode == 200) {
      await transit();
      print(result.body);
    } else if (result.statusCode == 500) {
      print(result.body);
    } else {
      print('there was an error,${result.statusCode}');
    }
  }
}
