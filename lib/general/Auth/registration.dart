import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hla/StateData/bloc/Authentication/registration_cubit.dart';
import 'package:hla/general/Auth/main.dart';
import 'package:hla/general/Parent.dart';

class promptregister extends StatefulWidget {
  const promptregister({super.key});

  @override
  State<promptregister> createState() => _promptregisterState();
}

class _promptregisterState extends State<promptregister> {
  late FToast fToast;
  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }
  _showToast(bool iserror,String message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: iserror ? Colors.red : Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iserror ? Icons.error_outline:Icons.check,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(message),
        ],
      ),
    );
    setState(() {
      fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 4),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    bool passwordvisibility = true;
    final registorObject = context.read<RegistrationCubit>();
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
        BlocConsumer<RegistrationCubit, RegistrationState>(
          listener : (context, state){
            if(state is RegistrationSuccess){
              _showToast(true, "Registration Successful");
              WidgetsBinding.instance.addPostFrameCallback((_) =>
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainAuth()))
            );

          }
          },
            builder: (context,state){
          if (state is RegistrationLoading) {
            return const Center(child: CircularProgressIndicator());
          }else if(state is RegistrationFailure){
            WidgetsBinding.instance.addPostFrameCallback((_) =>
               _showToast(true, state.error)
            );
          }

          return SingleChildScrollView(
            child: Align(
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 32, 0, 8),
                                  child: Text(
                                    'Join us & cook with confidence',
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 12),
                                  child: Text(
                                    'Save delicious recipes and get personalized content.',
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: TextFormField(
                                    controller: registorObject.nameController,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'First Name and Last Name',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: TextFormField(
                                    controller:
                                        registorObject.studentIDController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Enter your StudentID',
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
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: TextFormField(
                                    controller: registorObject
                                        .confirmPasswordController,
                                    decoration: InputDecoration(
                                      labelText: 'Confirm Password',
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => passwordvisibility =
                                              !passwordvisibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
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
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 24),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        registorObject.confirmRegistration();
                                      },
                                      child: const Text('Register Account'),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
