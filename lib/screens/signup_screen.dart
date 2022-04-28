import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_front_task/widgets/custom_text_field.dart';

import '../logic/auth/auth_cubit.dart';

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
              : Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(controller: _emailController),
                      CustomTextField(controller: _passwordController),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthCubit>().signUp(
                              _emailController.text, _passwordController.text);
                        },
                        child: Text("Sign Up"),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
