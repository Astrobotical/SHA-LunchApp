import 'package:flutter/material.dart';

class promptregister extends StatefulWidget {
  const promptregister({super.key});

  @override
  State<promptregister> createState() => _promptregisterState();
}

class _promptregisterState extends State<promptregister> {
  @override
  Widget build(BuildContext context) {
    bool passwordvisibility = true;
    return
    Scaffold(
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
        'Account Registration',
        style: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          color: Color(0xFF14181B),
          fontSize: 25,
          fontWeight: FontWeight.normal,
        ),
      ),
      centerTitle: true,
    ),
    body:
      SingleChildScrollView(
      child:
      Align(
        alignment: AlignmentDirectional(0.00, 0.00),
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 670,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(12, 32, 0, 8),
                          child: Text(
                            'Join us & cook with confidence',
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(12, 0, 0, 12),
                          child: Text(
                            'Save delicious recipes and get personalized content.',
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: TextFormField(
                         //   controller: _model.textController1,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'First Name and Last Name',
                              ),
                                ),
                              ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: TextFormField(
                            //  controller: //_model.textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Enter your StudentID',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              contentPadding:
                              EdgeInsetsDirectional.fromSTEB(
                                  0, 16, 16, 8),
                            ),
                            //validator: _model.textController2Validator
                            //  .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: TextFormField(
                            //  controller: _model.textController3,
                            //focusNode: _model.textFieldFocusNode3,,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                      () => passwordvisibility =
                                  !passwordvisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  passwordvisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 24,
                                ),
                              ),
                            ),


                        ),
                        ),
                        Center(
                            child:
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 24),
                          child: ElevatedButton(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            child: Text('Create Account'),
                          ),
                        ),
                        )]),
                              ),
                          ),
                        ),


                        /*
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor:
                          ),
                          child: CheckboxListTile(
                            value: _model.checkboxListTileValue ??= true,
                            onChanged: (newValue) async {
                              setState(() =>
                              _model.checkboxListTileValue = newValue!);
                            },
                            title: Text(
                              'I would like to receive inspriation emails.',
                            ),
                            dense: false,
                            controlAffinity:
                            ListTileControlAffinity.leading,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                16, 0, 16, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),

                         */


            ],
          ),
        ),
      ),
    )
    );
  }
}
