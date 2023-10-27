import 'package:flutter/material.dart';
import 'package:hla/StateData/bloc/Authentication/auth_cubit.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hla/general/Auth/signup.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../StateData/bloc/Authentication/auth_state.dart';
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late AuthCubit CurrentContext;

  @override
  void initState() {
    super.initState();
    CurrentContext = BlocProvider.of<AuthCubit>(context);
  }
  @override
  Widget build(BuildContext context) {
    final Cubitobj = context.read<AuthCubit>();
    ButtonState? changedstate;
    return SingleChildScrollView(
        child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state){
            return Align(
            alignment: AlignmentDirectional(0.00, -1.00),
        child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 230,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  const Text('Welcome Back',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF101213),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,),),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 24),
                    child: Text(
                      'Fill out the information below in order to access your account.',
                      textAlign: TextAlign.start,
                      style:
                      TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 16),
                    child: TextFormField(
                      //controller: _model.emailAddressController,
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'StudentID or Email',
                        labelStyle: TextStyle(
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
                      style:
                      const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF101213),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      /* validator: _model.emailAddressControllerValidator
                      .asValidator(context), */
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 16),
                    child: TextFormField(
                      //  controller: _model.passwordController,
                      textCapitalization: TextCapitalization.sentences,
                      //  obscureText: !_model.passwordVisibility,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                        suffixIcon: InkWell(
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            Icons.visibility_outlined,
                            color: Color(0xFF57636C),
                            size: 20,
                          ),
                        ),
                      ),
                      style:
                      const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF101213),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      /* validator: _model.passwordControllerValidator
                      .asValidator(context), */
                    ),
                  ),
                  StreamBuilder(stream: Cubitobj.buttonState.stream, 
                  builder: (context, snapshot){
                    return Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child:
                      ProgressButton.icon(iconedButtons: {
                        ButtonState.idle: IconedButton(
                            text: "Send",
                            icon: Icon(Icons.send, color: Colors.white),
                            color: Colors.deepPurple.shade500),
                        ButtonState.loading:
                        IconedButton(text: "Loading", color: Colors.deepPurple.shade700),
                        ButtonState.fail: IconedButton(
                            text: "Failed",
                            icon: Icon(Icons.cancel, color: Colors.white),
                            color: Colors.red.shade300),
                        ButtonState.success: IconedButton(
                            text: "",
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.white,
                            ),
                            color: Colors.green.shade400)
                      }, onPressed: () async {CurrentContext.stateprogress();
                      await Future.delayed(const Duration(seconds: 2),(){
                        CurrentContext.statesucess();
                        });}, state:state.ButtionState as ButtonState?)
                  )
                    );},
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16, 0, 16, 12),
                          child: Text(
                            'Or sign in with',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                Cubitobj.googleLogin();
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.grey[200]
                                ), child: Image.asset('assets/logos/glogo.png'),
                                height: 90,
                              )
                          ),
                          const Gap(20),
                          InkWell(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.grey[200]
                                ),
                                child: Image.asset('assets/logos/apple.png'),
                                height: 90,
                              )
                          )
                        ],
                      ),
                      /*
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Wrap(
                              spacing: 16,
                              runSpacing: 0,
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.center,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Container(
                                    width: 230,
                                    height: 44,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xFFE0E3E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(40),

                                      color: Colors.white,
                                    ),
                                    child: const Align(
                                      child: Wrap(
                                        alignment: WrapAlignment.spaceAround,
                                        crossAxisAlignment: WrapCrossAlignment
                                            .center,
                                        children: [
                                          FaIcon(
                                              FontAwesomeIcons.google,
                                              size: 20,
                                              color: Colors.black
                                          ),
                                          Center(child: Text(
                                              'Continue with Google',
                                              style: TextStyle(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF101213),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              )))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Container(
                                      width: 230,
                                      height: 44,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xFFE0E3E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),

                                        color: Colors.white,
                                      ),
                                      child: const Align(

                                        child: Wrap(
                                          alignment: WrapAlignment.spaceAround,
                                          crossAxisAlignment: WrapCrossAlignment
                                              .center,
                                          children: [

                                            FaIcon(
                                              FontAwesomeIcons.apple,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                            Center(
                                              child: Text('Continue with Apple',
                                                  style: TextStyle(
                                                    fontFamily: 'Plus Jakarta Sans',
                                                    color: Color(0xFF101213),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            )
                                          ],
                                        ),)),
                                ),
                              ],
                            ),
                          ),
                          */
                      InkWell(
                          onTap: () {},
                          child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: const Text(
                                  "Forgot Password?", style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF101213),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,)
                              )
                          )
                      )
                    ],
                  )
                ]
            )
        )
    );}));
  }

  Widget buildTextWithIcon(ButtonState? currentstate) {

    return ProgressButton.icon(iconedButtons: {
      ButtonState.idle: IconedButton(
          text: "Send",
          icon: Icon(Icons.send, color: Colors.white),
          color: Colors.deepPurple.shade500),
      ButtonState.loading:
      IconedButton(text: "Loading", color: Colors.deepPurple.shade700),
      ButtonState.fail: IconedButton(
          text: "Failed",
          icon: Icon(Icons.cancel, color: Colors.white),
          color: Colors.red.shade300),
      ButtonState.success: IconedButton(
          text: "",
          icon: Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          color: Colors.green.shade400)
    }, onPressed: () {}, state:currentstate);
  }
}

