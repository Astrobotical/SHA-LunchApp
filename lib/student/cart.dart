import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:hla/StateData/Models/CartModel.dart';
import 'package:hla/StateData/bloc/FoodGalore/cubit/cart_cubit.dart';
import 'package:hla/StateData/bloc/parent_cubit.dart';
import 'package:hla/general/Parent.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late FToast fToast;
  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final methodobj = context.read<CartCubit>();
    final ParentObject = context.read<ParentCubit>();
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
                if (state is CartCheckoutSuccess) {
                  _showSuccess();
                }
                if (state is CartPopulateDone) {
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      child: FutureBuilder(
                          future: methodobj.getItems(),
                          builder: ((context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.done) {
                              return ListView.builder(
                                controller: ParentObject.scrollController,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return Listitem(
                                        index: index,
                                        cart: snapshot.data![index],
                                        fToast: fToast);
                                  });
                            }
                            return const Center(
                                child: Text("Loading 1",
                                    style: TextStyle(fontSize: 20)));
                          })));
                }
                return SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: FutureBuilder(
                        future: methodobj.getItems(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.connectionState ==
                                  ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.data!.isEmpty) {
                            return const Center(
                                child: Text(
                              "The cart is empty",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ));
                          }
                          if (snapshot.hasData &&
                              snapshot.connectionState ==
                                  ConnectionState.done) {
                            return ListView.builder(
                              controller: ParentObject.scrollController,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Listitem(
                                      index: index,
                                      cart: snapshot.data![index],
                                      fToast: fToast);
                                });
                          }
                          return const Center(
                              child: Text("Loading ",
                                  style: TextStyle(fontSize: 20)));
                        })));
              }),
              ElevatedButton(

                  onPressed:  ()async  {
                   await  methodobj.checkout();
                  },
                  child: const Text(
                    "Checkout",
                    style: TextStyle(fontSize: 18),
                  )),
              Gap(30),
            ]));
  }

  _showSuccess() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("Checkout Success"),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 4),
    );
  }
}

class Listitem extends StatefulWidget {
  const Listitem(
      {super.key,
      required this.index,
      required this.cart,
      required this.fToast});
  final CartModel cart;
  final int index;
  final FToast fToast;
  @override
  State<Listitem> createState() => _Listitem();
}

class _Listitem extends State<Listitem> {
  Color? removecolor = Colors.blueGrey[100];
  @override
  Widget build(BuildContext context, {Data}) {
    final methodobj = context.read<CartCubit>();
    return SingleChildScrollView(
        child: Container(
            margin: widget.index != 0 ? EdgeInsets.only(top: 30) : null,
            padding: widget.index != 0 ? EdgeInsets.only(top: 30) : null,
            decoration: BoxDecoration(
                border: widget.index != 0
                    ? Border(
                        top: BorderSide(
                            color: Colors.grey,
                            width: 2,
                            style: BorderStyle.solid))
                    : null),
            width: MediaQuery.sizeOf(context).width / 2,
            height: 300,
            child: Column(children: [
              Expanded(
                  child: Row(children: [
                Expanded(
                    child: Column(children: [
                  Expanded(
                    child: Container(
                        width: 400,
                        child: Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text(widget.cart.FoodCategory,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w200)),
                                  Container(
                                      margin: EdgeInsets.only(right: 80),
                                      child: Text(
                                        widget.cart.FoodName,
                                        style: TextStyle(fontSize: 25),
                                      )),
                                ])),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Image.network(
                                  widget.cart.FoodImage,
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
                                    child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Text('Side',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w200)),
                                          Container(
                                              margin:
                                                  EdgeInsets.only(right: 80),
                                              child: Text(
                                                widget.cart.SideFoodName,
                                                style: TextStyle(fontSize: 25),
                                              )),
                                        ])),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Image.network(
                                          widget.cart.SideFoodImage,
                                          height:
                                              MediaQuery.sizeOf(context).height,
                                          fit: BoxFit.cover,
                                          width: 100,
                                        )),
                                  ],
                                ))),
                          )
                        ],
                      ),
                    )
                  ]))
                ]))
              ])),
              Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        methodobj.deletefromCart((widget.cart.AIN));
                        _showToast();
                        setState(() {
                          removecolor = Colors.red;
                          Future.delayed(const Duration(seconds: 4), () {
                            removecolor = Colors.blueGrey[100];
                          });
                        });
                      },
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.only(left: 30, bottom: 40, top: 20),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: removecolor,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(7, 0, 7, 0),
                                child: Text('Remove',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                          ),
                        ),
                      )))
            ])));
  }

  Future<void> buttonchanger() async {
    setState(() async {
      removecolor = Colors.red;
      await Future.delayed(const Duration(seconds: 4), () {
        removecolor = Colors.blueGrey[100];
      });
    });
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("Item Removed "),
        ],
      ),
    );

    widget.fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 4),
    );
  }
}
