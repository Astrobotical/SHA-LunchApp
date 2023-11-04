import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdditemWidget extends StatefulWidget {
  const AdditemWidget({super.key});

  @override
  State<AdditemWidget> createState() => _AdditemWidgetState();
}

class _AdditemWidgetState extends State<AdditemWidget> {
  String image = "";
  String Category = 'Select Category';
  String StudentType = 'Select Student Type';
  String MealType = 'Select Meal Type';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: ()  {
                 Navigator.pushNamed(context, '/');
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF14181B),
                  size: 30,
                ),
              ),
              title: Text(
                'Add Menu Item',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  color: Color(0xFF14181B),
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: 
                              Image.network(
                                image == ""? "https://cdn.dribbble.com/users/1012566/screenshots/4187820/media/985748436085f06bb2bd63686ff491a5.jpg?resize=400x300&vertical=center":
                                "https://www.inspiredtaste.net/wp-content/uploads/2022/11/Blueberry-Pie-Recipe-Video.jpg",
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Upload Image'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ))),
                     FittedBox(
                        fit: BoxFit.fitWidth,
                        child:
                Row(children: [
                  Container(
                      margin: const EdgeInsets.only(left: 30, right: 50),
                      height: 30,
                      child: Text(
                        "Meal Category",
                        style: TextStyle(fontSize: 20),
                      )),
                     
                  DropdownButton<String>(
                      value: Category,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      onChanged: (String? newValue) {
                        setState(() {
                          Category = newValue!;
                        });
                      },
                      items: <String>[
                        'Select Category',
                        'Breakfast',
                        'Lunch',
                        'Dinner',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList())
                      
                ])),
                Gap(30),
                FittedBox(
                        fit: BoxFit.fitWidth,
                        child:
                Row(children: [
                  Container(
                      margin: const EdgeInsets.only(left: 30, right: 50),
                      height: 30,
                      child: Text(
                        "Student Type",
                        style: TextStyle(fontSize: 20),
                      )),
                  DropdownButton<String>(
                      value: StudentType,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      onChanged: (String? newValue) {
                        setState(() {
                          StudentType = newValue!;
                        });
                      },
                      items: <String>[
                        'Select Student Type',
                        'Eat All',
                        'Only Plants'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList())
                ])),
                Gap(30),
                FittedBox(
                        fit: BoxFit.fitWidth,
                        child:
                Row(children: [
                  Container(
                      margin: const EdgeInsets.only(left: 30, right: 50),
                      height: 30,
                      child: Text(
                        "Meal Type",
                        style: TextStyle(fontSize: 20),
                      )),
                  DropdownButton<String>(
                      value: MealType,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      onChanged: (String? newValue) {
                        setState(() {
                          MealType = newValue!;
                        });
                      },
                      items: <String>[
                        'Select Meal Type',
                        'Main Dish',
                        'Side Dish',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList())
                ])),
                Gap(30),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Add Menu Item",
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            )));
  }
}
