import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_front_task/logic/city/location_cubit.dart';
import 'package:step_front_task/models/country_model.dart';
import 'package:step_front_task/widgets/app_fake_dropdown_button.dart';

class CitySelectionScreen extends StatelessWidget {
  CitySelectionScreen({Key? key}) : super(key: key);
  static const routeName = "/city-selection-screen";
  late LocationCubit _locationCubit;
  String? _currentCountryName;
  String? _currentCityName;

  @override
  Widget build(BuildContext context) {
    _locationCubit = context.read<LocationCubit>();
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (_locationCubit.currentCountry != null) {
          _currentCountryName = _locationCubit.currentCountry!.country;
          _currentCityName = _locationCubit.currentCity;
        }
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.white, Colors.blue])),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("City Selection",
                      style: GoogleFonts.lobster(
                          fontSize: 22, color: Colors.black54)),
                  AppFakeDropdownButton(
                      initialValue: _currentCountryName,
                      pressedFunction: () => _getCountriesBottomSheet(context)),
                  AppFakeDropdownButton(
                      initialValue: _currentCityName,
                      pressedFunction: () => _getCitiesBottomSheet(context)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _getCountriesBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white70,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        )),
        builder: (_) {
          return Container(
            height: 430,
            child: Column(
              children: [
                ListTile(
                  title: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Select",
                          style: GoogleFonts.lobster(
                              fontSize: 20, color: Colors.black54))),
                  trailing: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const Divider(color: Colors.black),
                SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (_, i) => _getCountryListTile(
                        _locationCubit.countryList[i], context),
                    itemCount: _locationCubit.countryList.length,
                  ),
                ),
              ],
            ),
          );
        });
  }

  _getCitiesBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white70,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        )),
        builder: (_) {
          return SizedBox(
            height: 450,
            child: Column(
              children: [
                ListTile(
                  title: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Select",
                          style: GoogleFonts.lobster(
                              fontSize: 20, color: Colors.black54))),
                  trailing: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const Divider(color: Colors.black),
                SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (_, i) =>
                        _getCityListTile(_locationCubit.cityList[i], context),
                    itemCount: _locationCubit.cityList.length,
                  ),
                ),
              ],
            ),
          );
        });
  }

  _getCountryListTile(CountryModel countryModel, BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(countryModel.country,
              style: GoogleFonts.lobster(fontSize: 20, color: Colors.black54)),
          onTap: () {
            _locationCubit.setCountry(countryModel);
            Navigator.of(context).pop();
          },
        ),
        const Divider(
          color: Colors.black,
          height: 0,
        ),
      ],
    );
  }

  _getCityListTile(String cityName, BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(cityName,
              style: GoogleFonts.lobster(fontSize: 20, color: Colors.black54)),
          onTap: () {
            _locationCubit.setCity(cityName, context);
            Navigator.of(context).pop();
          },
        ),
        const Divider(
          color: Colors.black,
          height: 0,
        ),
      ],
    );
  }
}
