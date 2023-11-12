import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hla/StateData/Models/MenuItemModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../ApiClient.dart';
part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());
  late List<MenuItemModel> Items;
  final ApiClient api = ApiClient();
  late List Sideitems;
  Future<void> initialize(String Category) async {
    Response result = await api.getActiveMenu();
    if (result.statusCode == 200) {
      //  emit(FoodLoading());
      //  getFood(Category);
    } else {
      emit(Foodempty());
    }
  }

  Future<List<dynamic>> getFood(String Category) async {
    Response result = await api.getMenuItems();
    if (result.statusCode == 200) {
      final Map<String, dynamic> items = jsonDecode(result.body);
      Iterable Data = items['data'];
      List Sorted = Data.where((item) =>item["ItemCategory"] == Category).toList();
      Sideitems =  Data.where((item) => item["SideTarget"] == Category).toList();
      print(Sorted);
//     emit(FoodDoneLoading());
      return Sorted;
    } else {}
    return Future.value([]);
  }
}
