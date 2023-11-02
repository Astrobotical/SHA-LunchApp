import 'package:flutter/material.dart';
import 'package:hla/student/activeMenu.dart';
import 'package:hla/general/Auth/main.dart';
import 'package:hla/student/activeMenu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:bloc/bloc.dart';
import 'package:hla/general/foodGalore/mainCatalog.dart';
import 'dart:math';
import 'package:slide_switcher/slide_switcher.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/cupertino.dart';
import 'package:hla/general/Parent.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Parent());
  //Bloc.observer = CubitObserver();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title}) : super(key: Key(title));

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();

  late GlobalKey<ArtDialogState> _artDialogKey;

  @override
  void initState() {
    _artDialogKey = GlobalKey<ArtDialogState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: ArtButton(
                      bgColor: Colors.purple,
                      btnText: "a success message",
                      onTab: () {
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                                type: ArtSweetAlertType.success,
                                title: "A success message!",
                                text: "Show a success message with an icon"));
                      },
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: ArtButton(
                      bgColor: Colors.purple,
                      btnText: "a message with title and text",
                      onTab: () {
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                                type: ArtSweetAlertType.question,
                                title: "A question?",
                                text: "Show a question message with an icon"));
                      },
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: ArtButton(
                      bgColor: Colors.purple,
                      btnText: "an error message",
                      onTab: () {
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                                type: ArtSweetAlertType.danger,
                                title: "Oops...",
                                text: "There is a problem :("));
                      },
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: ArtButton(
                      bgColor: Colors.purple,
                      btnText: "A dialog with three buttons",
                      onTab: () async {
                        ArtDialogResponse response = await ArtSweetAlert.show(
                            barrierDismissible: false,
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              showCancelBtn: true,
                              denyButtonText: "Don't save",
                              title: "Do you want to save the changes?",
                              confirmButtonText: "Save",
                            ));

                        if (response == null) {
                          return;
                        }

                        if (response.isTapConfirmButton) {
                          ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.success,
                                  title: "Saved!"));
                          return;
                        }

                        if (response.isTapDenyButton) {
                          ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.info,
                                  title: "Changes are not saved!"));
                          return;
                        }
                      },
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: ArtButton(
                      bgColor: Colors.purple,
                      btnText: "A confirm dialog",
                      onTab: () async {
                        ArtDialogResponse response = await ArtSweetAlert.show(
                            barrierDismissible: false,
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                                denyButtonText: "Cancel",
                                title: "Are you sure?",
                                text: "You won't be able to revert this!",
                                confirmButtonText: "Yes, delete it",
                                type: ArtSweetAlertType.warning));

                        if (response == null) {
                          return;
                        }

                        if (response.isTapConfirmButton) {
                          ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.success,
                                  title: "Deleted!"));
                          return;
                        }
                      },
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: ArtButton(
                      bgColor: Colors.purple,
                      btnText: "A message with a custom image",
                      onTab: () async {
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                                title: "Sweet!",
                                text: "Modal with a custom image.",
                                customColumns: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 12.0),
                                    child: Image.network(
                                      "https://unsplash.it/400/200",
                                    ),
                                  )
                                ]));
                      },
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: ArtButton(
                      bgColor: Colors.purple,
                      btnText: "Custom padding, background",
                      onTab: () async {
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                                dialogPadding: EdgeInsets.all(60),
                                title: "Custom padding, background.",
                                barrierColor: Color.fromRGBO(0, 0, 123, 0.4),
                                decorationImage: DecorationImage(
                                    image:
                                        AssetImage('assets/images/trees.png'),
                                    fit: BoxFit.fill)));
                      },
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: ArtButton(
                      bgColor: Colors.purple,
                      btnText: "Submit your Github username",
                      onTab: () async {
                        ArtDialogResponse response = await ArtSweetAlert.show(
                            artDialogKey: _artDialogKey,
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              title: "Submit your Github username!",
                              customColumns: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 20.0),
                                  child: CupertinoTextField(
                                    controller: _textController,
                                  ),
                                )
                              ],
                              onConfirm: () async {
                                _artDialogKey.currentState?.showLoader();
                                var response = await http.get(Uri.parse(
                                    'https://api.github.com/users/' +
                                        _textController.text));
                                if (response.statusCode != 200) {
                                  _artDialogKey.currentState?.hideLoader();
                                  _artDialogKey.currentState
                                      ?.showErrors(["Request failed: Error"]);
                                  return;
                                }
                                var body = response.body;
                                var bodyJson = json.decode(body);
                                _artDialogKey.currentState?.hideLoader();
                                _artDialogKey.currentState?.closeDialog(
                                    data: {"image": bodyJson["avatar_url"]});
                              },
                              onDispose: () {
                                _artDialogKey = GlobalKey<ArtDialogState>();
                              },
                            ));

                        if (response == null) {
                          return;
                        }

                        if (response.isTapConfirmButton) {
                          ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(customColumns: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 12.0),
                                  child: Image.network(response.data["image"]),
                                )
                              ]));
                          return;
                        }
                      },
                    )),
              ],
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

/*
class _MyHomePageState extends State<MyHomePage> {
  int switcherIndex1 = 0;
  int switcherIndex2 = 0;
  int switcherIndex3 = 0;
  int switcherIndex4 = 0;
  int switcherIndex5 = 0;
  int switcherIndex6 = 0;
  int switcherIndex7 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: switcherIndex1 == 0
          ? Colors.white10.withOpacity(0.27)
          : Colors.white10.withOpacity(0.2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideSwitcher(
              children: [
                Container(
                  alignment: Alignment.center,
                  child:Icon(Icons.light_mode)),
            
                Container(
                  alignment: Alignment.center,
                  child:Icon(Icons.dark_mode)),
              ],
              containerHeight: 50,
              containerWight: 70,
              isAllContainerTap: true,
              onSelect: (int index) => setState(() => switcherIndex1 = index),
              indents: 5,
              containerColor:
                  switcherIndex1 == 0 ? Colors.grey : Colors.deepOrange,
            ),
            const SizedBox(height: 20),
            SlideSwitcher(
              children: [
                Text(
                  'Breakfast',
                  style: TextStyle(
                       fontSize: 18,
                    fontWeight:
                        switcherIndex2 == 0 ? FontWeight.w500 : FontWeight.w400,
                    color:
                        switcherIndex2 == 0 ? Colors.deepOrange : Colors.white,
                  ),
                ),
                Text(
                  'Lunch',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                        switcherIndex2 == 1 ? FontWeight.w500 : FontWeight.w400,
                    color:
                        switcherIndex2 == 1 ? Colors.deepOrange : Colors.white,
                  ),
                ),
                Text(
                  'Dinner',
                  style: TextStyle(
                       fontSize: 18,
                    fontWeight:
                        switcherIndex2 == 2 ? FontWeight.w500 : FontWeight.w400,
                    color:
                        switcherIndex2 == 2 ? Colors.deepOrange : Colors.white,
                  ),
                ),
              ],
              containerColor: Colors.deepOrange,
              onSelect: (int index) => setState(() => switcherIndex2 = index),
              containerHeight: 40,
              containerWight: 350,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
*/
class CubitObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(error);
  }
}