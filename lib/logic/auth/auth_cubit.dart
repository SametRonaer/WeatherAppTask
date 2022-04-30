import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:step_front_task/screens/home_screen.dart';
import 'package:step_front_task/screens/login_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> signUp(String email, String password) async {
    try {
      emit(AuthLoading());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "New User Created!",
          colorText: Colors.white, backgroundColor: Colors.green);
      Get.offAllNamed(LoginScreen.routeName);
      emit(AuthLoaded());
    } catch (e) {
      Get.snackbar("Error Appear!", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
      emit(AuthError());
      print(e);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(HomeScreen.routeName);
      emit(AuthLoaded());
    } catch (e) {
      Get.snackbar("Error Appear!", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
      emit(AuthError());
      print(e);
    }
  }
}
