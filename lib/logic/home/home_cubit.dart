import 'dart:developer';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:step_front_task/helpers/constants.dart';
import 'package:step_front_task/helpers/network_service.dart';
import 'package:step_front_task/models/weather_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  LocationData? _userLocation;
  WeatherModel? _weather;
  WeatherModel? get weather => _weather;

  Future<void> setOriginalUserLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    Location _location = Location();
    emit(HomeLoading());

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _userLocation = await _location.getLocation();
    getWeatherConditionOfLocation(_userLocation!);
    emit(HomeLoaded());
  }

  Future<void> getWeatherConditionOfLocation(LocationData locationData) async {
    String apiUrl = "https://api.openweathermap.org/data/2.5/weather";
    final wearherData =
        await NetworkService.sendGetRequest(endPoint: apiUrl, queryParameters: {
      "lat": locationData.latitude,
      "lon": locationData.longitude,
      "appid": kWeatherApiKey,
      "units": "metric"
    });
    _weather = WeatherModel.fromMap(wearherData);
  }

  Future<void> getCities() async {}
}
