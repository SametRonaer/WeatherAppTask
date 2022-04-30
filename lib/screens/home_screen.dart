import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_front_task/logic/home/home_cubit.dart';
import 'package:step_front_task/models/weather_model.dart';
import 'package:step_front_task/screens/city_selection_screen.dart';

import '../logic/city/location_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home-screen";

  WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    context.read<LocationCubit>().getAllCountries();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        weather = context.read<HomeCubit>().weather;
        return SafeArea(
          child: Container(
            child: Scaffold(
                backgroundColor: Colors.blue,
                floatingActionButton: FloatingActionButton(
                    backgroundColor: Colors.blue.shade200,
                    child: const Icon(Icons.map),
                    onPressed: () async =>
                        await Get.toNamed(CitySelectionScreen.routeName)),
                body: state is HomeLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
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
                              margin: EdgeInsets.all(12),
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white38),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    context.read<LocationCubit>().currentCity ??
                                        "",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lobster(
                                        fontSize: 45, color: Colors.black54),
                                  ),
                                  if (weather != null)
                                    Text("Temperature:\n${weather!.main!.temp}",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.lobster(
                                            fontSize: 45,
                                            color: Colors.black54)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
          ),
        );
      },
    );
  }
}
