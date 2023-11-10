import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hla/StateData/bloc/student/bloc/support_bloc_bloc.dart';
import 'package:in_app_review/in_app_review.dart';

class SupportWidget extends StatefulWidget {
  const SupportWidget({super.key});

  @override
  State<SupportWidget> createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
  String Suggestiontype = "Select a Suggestion";
  String Reporttype = "Select a Topic";
  @override
  Widget build(BuildContext context) {
    final Cubitobj = context.read<SupportBlocBloc>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.blue,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              title: Text('Support', style: TextStyle(fontSize: 30)),
              actions: [],
              centerTitle: true,
              elevation: 0,
            ),
            body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                      child: Text(
                        'How can we assist you?',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                                customColumns: [
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      height:
                                          MediaQuery.sizeOf(context).height / 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Center(
                                                child: Text(
                                                  'Feedback Submission',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            ),
                                            Gap(20),
                                            FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: BlocBuilder<
                                                      SupportBlocBloc,
                                                      SupportBlocState>(
                                                  builder: (context, state) {
                                                if (state is Onchanged) {
                                                  DropdownButton<String>(
                                                      value: Suggestiontype,
                                                      icon: const Icon(
                                                        Icons.arrow_downward,
                                                        color: Colors.blue,
                                                      ),
                                                      iconSize: 24,
                                                      elevation: 16,
                                                      style: const TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 20),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          context
                                                              .read<
                                                                  SupportBlocBloc>()
                                                              .add(Onchanged());
                                                          Suggestiontype =
                                                              newValue!;
                                                        });
                                                      },
                                                      items: <String>[
                                                        'Select a Suggestion',
                                                        'Staff Feedback',
                                                        'Food Recommendations'
                                                      ].map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList());
                                                }
                                                return DropdownButton<String>(
                                                    value: Suggestiontype,
                                                    icon: const Icon(
                                                        Icons.arrow_downward,
                                                        color: Colors.blue),
                                                    iconSize: 24,
                                                    elevation: 16,
                                                    style: const TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 20),
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        context
                                                            .read<
                                                                SupportBlocBloc>()
                                                            .add(Onchanged());
                                                        Suggestiontype =
                                                            newValue!;
                                                      });
                                                    },
                                                    items: <String>[
                                                      'Select a Suggestion',
                                                      'Staff Feedback',
                                                      'Food Recommendations'
                                                    ].map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList());
                                              }),
                                            ),
                                            Gap(30),
                                            FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            8, 0, 8, 16),
                                                    child: TextFormField(
                                                        //controller: _model.emailAddressController,
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        maxLines: null,
                                                        minLines: 3,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .sentences,
                                                        obscureText: false,
                                                        style: TextStyle(
                                                            fontSize: 25),
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Please enter your message',
                                                          labelStyle: TextStyle(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: Color(
                                                                0xFF57636C),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          hintStyle:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: Color(
                                                                0xFF57636C),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFE0E3E7),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color:
                                                                  Colors.blue,
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        )
                                                        ),
                                                  ),
                                                ))
                                          ])),
                                ],
                                confirmButtonColor: Colors.blue,
                                confirmButtonText: "Submit Feedback",
                                showCancelBtn: true,
                                cancelButtonColor: Colors.red));
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.feedback_outlined,
                                    color: Colors.blue,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Text('Give Feedback',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.blue)),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.90, 0.00),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.blue,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),



                    InkWell(
                      onTap: () {
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                                customColumns: [
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      height:
                                          MediaQuery.sizeOf(context).height / 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                      ),
                                      child: 
                                      SingleChildScrollView(
                                        child:
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Center(
                                                child: Text(
                                                  'Report Submission',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            ),
                                            Gap(20),
                                            FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: BlocBuilder<
                                                      SupportBlocBloc,
                                                      SupportBlocState>(
                                                  builder: (context, state) {
                                                if (state is Onchanged) {
                                                  DropdownButton<String>(
                                                      value: Reporttype,
                                                      icon: const Icon(
                                                        Icons.arrow_downward,
                                                        color: Colors.blue,
                                                      ),
                                                      iconSize: 24,
                                                      elevation: 16,
                                                      style: const TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 20),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          context
                                                              .read<
                                                                  SupportBlocBloc>()
                                                              .add(Onchanged());
                                                          Reporttype =
                                                              newValue!;
                                                        });
                                                      },
                                                      items: <String>[
                                                        'Select a Topic',
                                                        'Lunch Service',
                                                        'Other'
                                                      ].map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList());
                                                }
                                                return DropdownButton<String>(
                                                    value: Reporttype,
                                                    icon: const Icon(
                                                        Icons.arrow_downward,
                                                        color: Colors.blue),
                                                    iconSize: 24,
                                                    elevation: 16,
                                                    style: const TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 20),
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        context
                                                            .read<
                                                                SupportBlocBloc>()
                                                            .add(Onchanged());
                                                        Reporttype =
                                                            newValue!;
                                                      });
                                                    },
                                                    items: <String>[
                                                   'Select a Topic',
                                                        'Lunch Service',
                                                        'Other'
                                                    ].map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList());
                                              }),
                                            ),
                                            Gap(30),
                                            FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            8, 0, 8, 16),
                                                    child: TextFormField(
                                                        //controller: _model.emailAddressController,
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        maxLines: null,
                                                        minLines: 3,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .sentences,
                                                        obscureText: false,
                                                        style: TextStyle(
                                                            fontSize: 25),
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Please enter your message',
                                                          labelStyle: TextStyle(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: Color(
                                                                0xFF57636C),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          hintStyle:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: Color(
                                                                0xFF57636C),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFE0E3E7),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color:
                                                                  Colors.blue,
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        )

                                                        /* validator: _model.emailAddressControllerValidator
                      .asValidator(context), */
                                                        ),
                                                  ),
                                                ))
                                          ])),)
                                ],
                                confirmButtonColor: Colors.blue,
                                confirmButtonText: "Submit Report",
                                showCancelBtn: true,
                                cancelButtonColor: Colors.red));
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.report_problem_outlined,
                                    color: Colors.blue,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Text(
                                      'Report an Issue',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.90, 0.00),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.blue,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
