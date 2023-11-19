import 'dart:math';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hla/StateData/Models/CartModel.dart';
import 'package:hla/StateData/Models/Fooditems.dart';
import 'package:hla/StateData/bloc/FoodGalore/cubit/cart_cubit.dart';
import 'package:hla/StateData/bloc/FoodGalore/cubit/food_cubit.dart';
import 'package:swipe_to/swipe_to.dart';

class CurrentMenu extends StatefulWidget {
  const CurrentMenu({super.key, required this.MenuType});

  final String MenuType;
  @override
  State<CurrentMenu> createState() => _CurrentMenuState();
}

class _CurrentMenuState extends State<CurrentMenu> {
  late FoodCubit CurrentContext;
  @override
  void initState() {
    super.initState();
    CurrentContext = BlocProvider.of<FoodCubit>(context);
    Future.delayed(const Duration(seconds: 3), () async {
      await CurrentContext.initialize(widget.MenuType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(children: [
              BlocBuilder<FoodCubit, FoodState>(builder: (context, state) {
                if (state is Foodempty) {
                  return Center(
                      child: Text("No Active Menu",
                          style: TextStyle(fontSize: 19)));
                }
                return SizedBox
                   (
                    height:720,
                    child: 
                  FutureBuilder<List<dynamic>>(
                      future: CurrentContext.getFood(widget.MenuType),
                      builder: (context, AsyncSnapshot snapped) {
                        if (snapped.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapped.hasError) {
                          return Text('Error found - ${snapped.error}');
                        }
                        return ListView.builder(
                            padding: EdgeInsets.only(
                                bottom: kBottomNavigationBarHeight + 15.0),
                            shrinkWrap: true,
                            itemCount: snapped.data!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  onFABPressed(
                                    context,
                                    "https://api.romarioburke.com/${snapped.data![index]["ItemImage"]}",
                                    '${snapped.data![index]["ItemName"]}',
                                    '${snapped.data![index]["ItemID"]}',
                                    widget.MenuType,
                                  );
                                  /*   ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.success,
                                      title: "Item Selected",
                                    ),
                                  );
                                  */
                                },
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 0),
                                  child: Container(
                                    width: double.infinity,
                                    child: Padding(
                                      padding:const EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Stack(children: [
                                        Container(
                                          width: double.infinity,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                    "https://api.romarioburke.com/${snapped.data![index]["ItemImage"]}",
                                                    width: double.infinity,
                                                    height: 200,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Container(
                                                  padding: const EdgeInsets.all(10),
                                                  margin: const EdgeInsets.only(
                                                      left: 20, bottom: 15),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    color: Colors.white,
                                                  ),
                                                  child: Text(
                                                    '${snapped.data![index]["ItemName"]}',
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: Color(0xFF14181B),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }),
                );
              })
            ])));
  }

  onFABPressed(BuildContext context, String image, String name, String uid,
      String foodCategory) {
    final FoodBloc = context.read<FoodCubit>();
    final CartBloc = context.read<CartCubit>();
    showDialog(
        context: context,
        builder: (context) {
          String SideID = "";
          String SideName = "";
          String SideFoodImage = "";
          return AlertDialog(
            backgroundColor: Colors.blueGrey,
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 2,
              height: double.maxFinite,
              child: Column(children: [
                FittedBox(
                    child: Text("Selected ${foodCategory} item",
                        style: TextStyle(fontSize: 20, color: Colors.white))),
                Gap(10),
                Stack(children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              image,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: 20, bottom: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF14181B),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                Gap(15),
                const FittedBox(
                    child: Text("Available Side Items",
                        style: TextStyle(fontSize: 18, color: Colors.white))),
                Container(
                    margin: const EdgeInsets.all(16),
                    height: 200,
                    child: Scrollbar(
                      interactive: true,
                      thumbVisibility: true,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: FoodBloc.Sideitems.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                                onTap: () {
                                  SideFoodImage =
                                      "https://api.romarioburke.com/${FoodBloc.Sideitems[index]['ItemImage']}";
                                  SideID =
                                      "${FoodBloc.Sideitems[index]['ItemID']}";
                                  SideName =
                                      "${FoodBloc.Sideitems[index]['ItemName']}";
                                },
                                child: Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Stack(children: [
                                      Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 8, 8, 8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  "https://api.romarioburke.com/${FoodBloc.Sideitems[index]['ItemImage']}",
                                                  width: double.infinity,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.only(
                                                    right: 20, bottom: 15),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: Colors.white,
                                                ),
                                                child: Text(
                                                  '${FoodBloc.Sideitems[index]["ItemName"]}',
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Color(0xFF14181B),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ])));
                          })),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Exit")),
                    ElevatedButton(
                        onPressed: () {
                        //  CartBloc.setMenuID();
                          CartModel tobesent = CartModel(
                              MenuID: "IDK",
                              FoodID: uid,
                              FoodName: name,
                              FoodImage: image,
                              SideID: SideID,
                              SideFoodName: SideName!,
                              SideFoodImage: SideFoodImage,
                              FoodCategory:foodCategory );
                          //   Modelobj.FoodID = FoodBloc.Sideitems[index]["ItemName"]
                          CartBloc.addtoCart(tobesent);
                          Navigator.pop(context);
                        },
                        child: const Text("Add to Checkout")),
                  ],
                )
              ]),
            ),
          );
        });
  }
}
