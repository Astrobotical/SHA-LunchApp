import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hla/StateData/bloc/FoodGalore/cubit/food_cubit.dart';
import 'package:image_picker/image_picker.dart';

class AdditemWidget extends StatefulWidget {
  const AdditemWidget({super.key});

  @override
  State<AdditemWidget> createState() => _AdditemWidgetState();
}

class _AdditemWidgetState extends State<AdditemWidget> {
  String image = "";
  String Category = 'Select Category';
  String StudentType = 'Select Student Type';
  String MealType = 'Meal Target if a side dish';
  late File _image = File("");
  final picker = ImagePicker();
  TextEditingController Foodname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Cubitobj = context.read<FoodCubit>();
    return  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
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
                child: BlocListener<FoodCubit, FoodState>(
                    listener: (context, state) {
                      if (state is FoodAdded) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Feedback Sent'),
                          duration: Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                        ));
                      }
                    },
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: image == ""
                                            ? Image.network(
                                                "https://cdn.dribbble.com/users/1012566/screenshots/4187820/media/985748436085f06bb2bd63686ff491a5.jpg?resize=400x300&vertical=center",
                                                width: double.infinity,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.file(_image)),
                                  ),
                                ),
                                Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        getImage();
                                      },
                                      child: Text('Upload Image'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 16),
                          child: TextFormField(
                            //  controller: _model.passwordController,
                            textCapitalization: TextCapitalization.sentences,
                            //  obscureText: !_model.passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Enter the Food Name',
                              labelStyle: const TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF57636C),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              hintStyle: const TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF57636C),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE0E3E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF4B39EF),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFF5963),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFF5963),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Color(0xCCFFFFFF),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF101213),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Row(children: [
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 30, right: 50),
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
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
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
                                    'Side'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList())
                            ])),
                        Gap(30),
                        FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Row(children: [
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 30, right: 50),
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
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      StudentType = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Select Student Type',
                                    'Eat All',
                                    'Only Plants'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList())
                            ])),
                        Gap(30),
                        FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Row(children: [
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 30, right: 50),
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
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      MealType = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Meal Target if a side dish',
                                    'Breakfast',
                                    'Lunch',
                                    'Dinner',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList())
                            ])),
                        Gap(30),
                        ElevatedButton(
                            onPressed: () {
                              Cubitobj.AddItem(
                                  _image, Foodname.text ,Category, MealType, StudentType);
                            },
                            child: Text(
                              "Add Menu Item",
                              style: TextStyle(fontSize: 20),
                            ))
                      ],
                    ))));
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = "123";
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
