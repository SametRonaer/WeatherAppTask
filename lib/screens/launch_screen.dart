import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_front_task/screens/login_screen.dart';
import 'package:step_front_task/screens/signup_screen.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);
  static const routeName = "/launch-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Get.toNamed(LoginScreen.routeName),
                child: const Text("Log In")),
            ElevatedButton(
                onPressed: () => Get.toNamed(SignUpScreen.routeName),
                child: const Text("Sign Up")),
          ],
        ),
      ),
    );
  }
}
