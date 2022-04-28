import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_front_task/logic/city/location_cubit.dart';

class CitySelectionScreen extends StatelessWidget {
  const CitySelectionScreen({Key? key}) : super(key: key);
  static const routeName = "/city-selection-screen";

  @override
  Widget build(BuildContext context) {
    context.read<LocationCubit>().getAllCountries();
    // context.read<LocationCubit>().getCityLocation("Van");
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text("City Selection"),
          ),
        );
      },
    );
  }
}
