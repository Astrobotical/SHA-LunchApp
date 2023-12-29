import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hla/StateData/bloc/Authentication/cubit/passwordreset_cubit.dart';
import 'package:hla/general/Auth/main.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
 void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
     backgroundColor: Colors.green,
        content: const Text('Password has been changed'),
      ),
    );
  }
  var originalPassword = null;
  var ConfirmationPassword = null;
  @override
   build(BuildContext context) {
    final currentcontext = context.read<PasswordresetCubit>();
    return Material(
        child: 
        BlocListener<PasswordresetCubit, PasswordresetState>(
          listener: (context, state) {
          if(state is PasswordResetSuccess){
            _showToast(context);
          }
          if(state is PasswordresetSuccess){
            Future.delayed(const Duration(seconds: 2),()=>
             Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const MainAuth()))
            );
          }
          if (state is PasswordConfirmationFailed) {
                    setState(() {
                    if(state.box == 1){
          
                      originalPassword = state.errormessage;
                    }else{
            
                      ConfirmationPassword = state.errormessage;
                    }
                      });
                  }
        },
        child:
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
              title: const Text("Change Password", style: TextStyle(color: Colors.black)),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Image.network('https://www.trustedreviews.com/wp-content/uploads/sites/54/2020/05/facebook-password-change-920x613.jpg',
                    width: 200,height: 200),
                Container(
                    margin: EdgeInsets.all(25),
                    child: const Text(
                      "Please enter your new password",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )),
                Container(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 16),
                    child: TextFormField(
                      controller: currentcontext.newPassword,
                      obscureText: false,
                      decoration: InputDecoration(
                        errorText:  originalPassword == null ? originalPassword:null,
                        labelText: 'Enter the new Password',
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
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF101213),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                 Container(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 16),
                    child: TextFormField(
                      controller: currentcontext.confirmnewPassword,
                      obscureText: false,
                      validator: ConfirmationPassword != null? ConfirmationPassword: null,
                      decoration: InputDecoration(
                        labelText: 'Confirm the new password',
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
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF101213),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                BlocBuilder<PasswordresetCubit, PasswordresetState>(
                    builder: (context, state) {
                  
                  return Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: ProgressButton.icon(
                              iconedButtons: {
                                ButtonState.idle: IconedButton(
                                    text: "Update Password",
                                    icon: Icon(Icons.send, color: Colors.white),
                                    color: Colors.blue.shade700),
                                ButtonState.loading: IconedButton(
                                    text: "Loading",
                                    color: Colors.deepPurple.shade700),
                                ButtonState.fail: IconedButton(
                                    text: "Failed",
                                    icon:
                                        Icon(Icons.cancel, color: Colors.white),
                                    color: Colors.red.shade300),
                                ButtonState.success: IconedButton(
                                    text: "",
                                    icon: Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                    ),
                                    color: Colors.green.shade400)
                              },
                              onPressed: () async {
                                currentcontext.validatingPassword();
                              },
                              state: state.currentstate)));
                }),
              ],
            ))));
  }
}