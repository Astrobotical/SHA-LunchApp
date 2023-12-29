import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hla/StateData/bloc/Authentication/cubit/passwordreset_cubit.dart';
import 'package:hla/general/Auth/forgetpassword/resetpassword.dart';
import 'package:hla/general/Auth/main.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class verifytoken extends StatelessWidget {
  const verifytoken({super.key});
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: const Text('The Token is incorrect'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentcontext = context.read<PasswordresetCubit>();
    currentcontext.stateReset();
    return Material(
        child: BlocListener<PasswordresetCubit, PasswordresetState>(
            listener: (context, state) {
              if (state is PasswordresetError) {
                _showToast(context);
              }
              if (state is TokenSuccess) {
                Future.delayed(
                    const Duration(seconds: 2),
                    (){
                      WidgetsBinding.instance.addPostFrameCallback((_) { 
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ResetPassword()));});
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
                  title: const Text("Validate Token", style: TextStyle(color: Colors.black)),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Image.network('https://cdn.shopify.com/s/files/1/0053/2889/6034/products/I34Front_3a0ff76f-d551-466c-a34f-6c51db929407_1024x1024.png?v=1639092631',
                    width: 200,height: 200),
                    Container(
                        margin: EdgeInsets.all(25),
                        child: const Text(
                          "Please enter your studentID or Email",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        )),
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 16),
                        child: TextFormField(
                          controller: currentcontext.resetinput,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Validate the token',
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
                      if (state is PasswordresetError) {}
                      return Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: ProgressButton.icon(
                                  iconedButtons: {
                                    ButtonState.idle: IconedButton(
                                        text: "Send",
                                        icon: Icon(Icons.send,
                                            color: Colors.white),
                                        color: Colors.deepPurple.shade500),
                                    ButtonState.loading: IconedButton(
                                        text: "Loading",
                                        color: Colors.deepPurple.shade700),
                                    ButtonState.fail: IconedButton(
                                        text: "Failed",
                                        icon: Icon(Icons.cancel,
                                            color: Colors.white),
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
                                    currentcontext.validatetoken();
                                  },
                                  state: state.currentstate)));
                    }),
                  ],
                ))));
  }
}
