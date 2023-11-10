import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MenuCounterWidget extends StatefulWidget {
  const MenuCounterWidget({super.key});

  @override
  State<MenuCounterWidget> createState() => _MenuCounterWidgetState();
}

class _MenuCounterWidgetState extends State<MenuCounterWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);;
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              title: Text(
                'Menu Counter',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  color:  Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
              centerTitle: true,
            ),
            body: 
            SingleChildScrollView(
              child:
                  FittedBox(
                  fit:BoxFit.fitWidth,
                  child:
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child:  Text("Menu for the date: ${now.day}/${now.month}/${now.year}", style: TextStyle(fontSize: 30,color :Colors.white),)
                
                ),
                FittedBox(
                  fit:BoxFit.fitWidth,
                  child:
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Breakfast',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                '10 ',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                'Status: Active',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Lunch',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                'Status: Counting',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ),
                FittedBox(
                  fit:BoxFit.fitWidth,
                  child:
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Dinner',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                'Status: Active',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Count',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              
                              Text(
                                'Status: DS',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ),
              Gap(20),
              Text("Status Code Meanings", style: TextStyle(fontSize: 20,color :Colors.white)),
              Gap(10),
          
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Text("Active: Menu is available for order", style: TextStyle(fontSize: 20,color :Colors.white)),
              Gap(10),
              Text("Counting: The Active Menu is being counted", style: TextStyle(fontSize: 20,color :Colors.white)),
              Gap(10),
              Text("DS: Menu item was Digitally Signed", style: TextStyle(fontSize: 20,color :Colors.white)),
              ],
            ),

              ],
            ),
      )
    )));
  }
}