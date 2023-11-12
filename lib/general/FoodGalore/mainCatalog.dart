import 'package:flutter/material.dart';
import 'package:slide_switcher/slide_switcher.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:hla/StateData/Models/MenuItemModel.dart';
import 'package:hla/general/FoodGalore/subWidgets/CurrentMenu.dart';
class FoodCatalog extends StatefulWidget {
  const FoodCatalog({super.key});
  @override
  _FoodCatalogState createState() => _FoodCatalogState();
}

class _FoodCatalogState extends State<FoodCatalog>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int switcherIndex2 = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    SingleChildScrollView(
      child:
    SizedBox(
      height: MediaQuery.of(context).size.height,
      child:
    Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: const Text(
                              'Food Catalog',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ]),
                  )),
              SlideSwitcher(
                containerColor: Colors.transparent,
                slidersColors: [const Color.fromRGBO(217, 217, 217, 85)],
                onSelect: (int index) {
                  setState(() {
                    switcherIndex2 = index;
                    _tabController.index = index;
                  });
                },
                containerHeight: 55,
                containerWight: 350,
                children: [
                  Text(
                    'Breakfast',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: switcherIndex2 == 0
                          ? FontWeight.w500
                          : FontWeight.w400,
                      color: switcherIndex2 == 0 ? Colors.white : Colors.white,
                    ),
                  ),
                  Text(
                    'Lunch',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: switcherIndex2 == 1
                          ? FontWeight.w500
                          : FontWeight.w400,
                      color: switcherIndex2 == 1 ? Colors.white : Colors.white,
                    ),
                  ),
                  Text(
                    'Dinner',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: switcherIndex2 == 2
                          ? FontWeight.w500
                          : FontWeight.w400,
                      color: switcherIndex2 == 2 ? Colors.white : Colors.white,
                    ),
                  ),
                ],
              ),
               Expanded(
                child:  TabBarView(
                  controller: _tabController,
                  children: const [
                    CurrentMenu(MenuType: "Breakfast"),
                    CurrentMenu(MenuType: "Lunch"),
                    CurrentMenu(MenuType: "Dinner")
                  ],
                ),
               )
            ])
    ));
  }
}
/*
class Menuitem extends StatelessWidget {
  final MenuItemModel item;
  const Menuitem({super.key, required this.item});

  @override
  Widget build(BuildContext context, {Data}) {
    final methodobj = context.read<AppState>();
    return  SwipeTo(
                      onRightSwipe: () {
                        ArtSweetAlert.show(
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.success,
                            title: "Item Selected",
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            child: Stack(children: [
                              Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          "https://www.inspiredtaste.net/wp-content/uploads/2022/11/Blueberry-Pie-Recipe-Video.jpg",
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
                                              BorderRadius.circular(25),
                                          color: Colors.white,
                                        ),
                                        child: const Text(
                                          "Blueberry Pie",
                                          style: const TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF14181B),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
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
                    ),
}
*/
