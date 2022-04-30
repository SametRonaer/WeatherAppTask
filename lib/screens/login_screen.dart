import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_front_task/logic/auth/auth_cubit.dart';
import 'package:step_front_task/widgets/app_button.dart';
import 'package:step_front_task/widgets/custom_text_field.dart';

import '../logic/home/home_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = "/login-screen";
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: state is AuthLoading
              ? Center(child: CircularProgressIndicator())
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
                          label: "Login",
                          buttonFunction: () {
                            context.read<AuthCubit>().login(
                                _emailController.text,
                                _passwordController.text);
                            context.read<HomeCubit>().setOriginalUserLocation();
                          },
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
