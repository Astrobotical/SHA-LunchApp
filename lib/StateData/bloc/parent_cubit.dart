import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  ParentCubit() : super(ParentInitial());
  final ScrollController scrollController = ScrollController();
  int cartCount = 0;
  bool isCartEmpty =  true;

 // void Cartincremented
}
