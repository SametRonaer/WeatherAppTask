import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_front_task/widgets/custom_text_field.dart';

import '../logic/auth/auth_cubit.dart';
import '../widgets/app_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static const routeName = "/sign-up-screen";
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: state is AuthLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.white, Colors.blue])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text("Email",
                            style: GoogleFonts.lobster(
                                fontSize: 22, color: Colors.black54)),
                      ),
                      CustomTextField(controller: _emailController),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text("Password",
                            style: GoogleFonts.lobster(
                                fontSize: 22, color: Colors.black54)),
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        isPassword: true,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: AppButton(
                          buttonFunction: () {
                            context.read<AuthCubit>().signUp(
                                _emailController.text,
                                _passwordController.text);
                          },
                          label: "Sign Up",
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
