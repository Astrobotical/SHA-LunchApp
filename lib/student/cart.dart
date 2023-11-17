import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hla/StateData/Models/CartModel.dart';
import 'package:hla/StateData/bloc/FoodGalore/cubit/cart_cubit.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final methodobj = context.read<CartCubit>();
    return Container(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: Text("My Cart",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))),
              Gap(10),
              BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                if (state is Cartloading) {
                  return const CircularProgressIndicator();
                }
                if (state is CartPopulateDone) {
                  return methodobj.Storeditems.isEmpty
                      ? const Center(
                          child: Text(
                            "The cart is empty",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      : SizedBox(
                          height: 720,
                          width: MediaQuery.sizeOf(context).width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: methodobj.Storeditems.length,
                              itemBuilder: (context, index) {
                                print("From List 1 ${methodobj.Storeditems}");
                                return _Listitem(index:index,
                                    cart: methodobj.Storeditems[index]);
                              }));
                }
                return methodobj.Storeditems.isEmpty
                    ? const Center(
                        child: Text(
                          "The cart is empty",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    : SizedBox(
                        height: 720,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: methodobj.Storeditems.length,
                            itemBuilder: (context, index) {
                              print("From List ${methodobj.Storeditems}");
                              return _Listitem(
                                  index:index,cart: methodobj.Storeditems[index]);
                            }));
              }),
            ]));
  }
}

class _Listitem extends StatelessWidget {
  final CartModel cart;
  final int index;
  const _Listitem({required this.index,required this.cart});

  @override
  Widget build(BuildContext context, {Data}) {
    final methodobj = context.read<CartCubit>();
    return Container(
      margin: index != 0 ? EdgeInsets.only(top:30):null,
      padding: index != 0 ? EdgeInsets.only(top:30):null,
        decoration: BoxDecoration(
          border: index != 0 ?
          Border(top:BorderSide(color: Colors.grey,width: 2,style: BorderStyle.solid)):
          null
        ),
        width: MediaQuery.sizeOf(context).width / 2,
        height: 300,
        child: Column(children: [
          Expanded(
              child: Row(children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        width: 400,
                        child: Expanded(
                            child: Row(
                          children: [
                            Expanded(child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                              Text(cart.FoodCategory,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200)),
                                
                            Container(
                                margin: EdgeInsets.only(right: 80),
                                child: Text(
                                  cart.FoodName,
                                  style: TextStyle(fontSize: 25),
                                )),
                                ]
                                )),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Image.network(
                                  cart.FoodImage,
                                  height: MediaQuery.sizeOf(context).height,
                                  width: 100,
                                )),
                          ],
                        ))),
                  ),
                  Expanded(
              child: Row(children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        width: 400,
                        child: Expanded(
                            child: 
                            Row(
                          children: [
                            Expanded(child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                             Text('Side',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200)),
                            Container(
                                margin: EdgeInsets.only(right: 80),
                                child: Text(
                                  cart.SideFoodName,
                                  style: TextStyle(fontSize: 25),
                                )),
                                  ])),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Image.network(
                                  cart.SideFoodImage,
                                  height: MediaQuery.sizeOf(context).height,
                                  fit:BoxFit.cover,
                                  width: 100,
                                )),
                          ],
                        ))),
                  )
                ],
              ),
            )
          ]))
        ]
        )
        )
        ])
          )
        ,
        Align(alignment: Alignment.topLeft,
        child:
        Container(
          width: 100,
          margin: EdgeInsets.only(left:30,bottom: 40,top:20),
          child:   Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: Container(
                                      height: 32,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.blueGrey[100],
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  7, 0, 7, 0),
                                          child: Text(
                                            'Remove',
                                            style: TextStyle(fontSize: 20)
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
        ))
        ])
    );
  }
}
