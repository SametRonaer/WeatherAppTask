import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_front_task/screens/login_screen.dart';
import 'package:step_front_task/screens/signup_screen.dart';
import 'package:step_front_task/widgets/app_button.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);
  static const routeName = "/launch-screen";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.white, Colors.blue])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text("Weather App",
                      style: GoogleFonts.lobster(
                          fontSize: 46, color: Colors.black54)),
                  margin: const EdgeInsets.all(15),
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40))),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                        label: "Login",
                        buttonFunction: () =>
                            Get.toNamed(LoginScreen.routeName)),
                    AppButton(
                        label: "Sign Up",
                        buttonFunction: () =>
                            Get.toNamed(SignUpScreen.routeName)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
