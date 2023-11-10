import 'package:flutter/material.dart';
import 'package:hla/cooks/SubWidgets/itemsEditor.dart';

class editMenuItem extends StatefulWidget {
  const editMenuItem({super.key});

  @override
  State<editMenuItem> createState() => _editMenuItemState();
}

class _editMenuItemState extends State<editMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30,
              ),
            ),
            title: Text(
              'Edit Menu Item',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.breakfast_dining_outlined),
                  text: "Breakfast",
                ),
                Tab(
                  icon: Icon(Icons.lunch_dining_outlined),
                  text: "Lunch",
                ),
                Tab(
                  icon: Icon(Icons.dinner_dining_outlined),
                  text: "Dinner",
                ),
                 Tab(
                  icon: Icon(Icons.food_bank_outlined),
                  text: "Sides",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
               itemsEditor(menuType: "Breakfast"),
               itemsEditor(menuType: "Lunch"),
               itemsEditor(menuType: "Dinner"),
               itemsEditor(menuType: "Sides"),
              ],
          ),
        ),
      ),
    );
  }
}
