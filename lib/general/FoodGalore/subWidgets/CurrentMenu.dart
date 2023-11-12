import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hla/StateData/Models/Fooditems.dart';
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
  void initState() {
    super.initState();
    CurrentContext = BlocProvider.of<FoodCubit>(context);
    Future.delayed(Duration(seconds: 3), () async {
      await CurrentContext.initialize(widget.MenuType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(bottom: 30),
            child: Column(children: [
              BlocBuilder<FoodCubit, FoodState>(builder: (context, state) {
                if (state is Foodempty) {
                  return Center(
                      child: Text("No Active Menu",
                          style: TextStyle(fontSize: 19)));
                }
                return Expanded(
                    child: Column(children: [
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
                            shrinkWrap: true,
                            itemCount: snapped.data!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  onFABPressed(context,
                                  "https://api.romarioburke.com/${snapped.data![index]["ItemImage"]}",
                                  '${snapped.data![index]["ItemName"]}',
                                  '${snapped.data![index]["ItemID"]}',
                                  widget.MenuType
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 0),
                                  child: Container(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                                padding: EdgeInsetsDirectional
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
                                                  padding: EdgeInsets.all(10),
                                                  margin: EdgeInsets.only(
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
                ]));
              })
            ])));
  }

  onFABPressed(BuildContext context,String image,String name,String uid,String foodCategory) {
    final FoodBloc = context.read<FoodCubit>();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey,
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 2 ,
              height: MediaQuery.of(context).size.height * 2 /1.5,
              child: Column(
                children: [
             
                   FittedBox(
                    child:Text("Selected ${foodCategory} item", style: TextStyle(fontSize: 20,color:Colors.white))
                  ),
                        Gap(10),
                  Stack(children: [
                                        Container(
                                          width: 200,
                                          height:200,
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
                                                  child:Image.network(
                                                    image,
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
                                                        BorderRadius.circular(
                                                            25),
                                                    color: Colors.white,
                                                  ),
                                                  child: Text(
                                                    name,
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: Color(0xFF14181B),
                                                      fontSize: 15,
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
                  Gap(15),
                  const FittedBox(
                    child:Text("Available Side Items", style: TextStyle(fontSize: 18,color:Colors.white))
                  ),
                Container(
                    margin: const EdgeInsets.all(16),
                    height: 200,
                    child: 
                    Scrollbar(
                      interactive: true,
                      thumbVisibility: true,
                      child:
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: FoodBloc.Sideitems.length,
                        itemBuilder: ((context, index) {
                          return 
                          Container(
                            margin: EdgeInsets.only(left: 10,right: 10),
                            child:         
                          Stack(children: [
                                        Container(
                                          width: 200,
                                          height:200,
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
                                                  child:Image.network(
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
                                                        BorderRadius.circular(
                                                            25),
                                                    color: Colors.white,
                                                  ),
                                                  child: Text(
                                                    '${FoodBloc.Sideitems[index]["ItemName"]}',
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: Color(0xFF14181B),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]));
;
                        })))),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Popper")),
              ]),
            ),
          );
        });
  }
}
