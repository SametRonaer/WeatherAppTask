import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_front_task/logic/auth/auth_cubit.dart';
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
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(controller: _emailController),
                    CustomTextField(controller: _passwordController),
                    ElevatedButton(
                        onPressed: () {
                          context.read<AuthCubit>().Login(
                              _emailController.text, _passwordController.text);
                          context.read<HomeCubit>().setOriginalUserLocation();
                        },
                        child: Text("Login")),
                  ],
                ),
        );
      },
    );
  }
}
