import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_front_task/logic/home/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home-screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
            body: state is HomeLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Text("Home"),
                    ],
                  ));
      },
    );
  }
}
