import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_front_task/helpers/constants.dart';
import 'package:step_front_task/helpers/network_service.dart';
import 'package:step_front_task/logic/home/home_cubit.dart';
import 'package:step_front_task/models/country_model.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  List<String> _cityList = [];
  List<String> get cityList => _cityList;

  List<CountryModel> _countryList = [];
  List<CountryModel> get countryList => _countryList;

  String? _currentCity;
  String? get currentCity => _currentCity;

  CountryModel? _currentCountry;
  CountryModel? get currentCountry => _currentCountry;

  Future<void> getAllCountries() async {
    emit(LocationLoading());
    final countriesData = await NetworkService.sendGetRequest(
        endPoint: "https://countriesnow.space/api/v0.1/countries");

    _countryList = (countriesData["data"] as List<dynamic>)
        .map((e) => CountryModel.fromMap(e))
        .toList();

    emit(LocationLoaded());
  }

  Future<void> setCountry(CountryModel country) async {
    _currentCountry = country;
    _currentCity = null;
    _cityList = _currentCountry!.cities as List<String>;
    emit(LocationLoaded());
  }

  Future<void> setCity(String city, BuildContext context) async {
    emit(LocationLoading());
    _currentCity = city;
    _getCityLocation(_currentCity!, context);
  }

  Future<void> _getCityLocation(String cityName, BuildContext context) async {
    final cityData = await NetworkService.sendGetRequest(
        endPoint: 'https://trueway-geocoding.p.rapidapi.com/Geocode',
        headers: {
          'X-RapidAPI-Host': 'trueway-geocoding.p.rapidapi.com',
          'X-RapidAPI-Key': kLocationApiKey
        },
        queryParameters: {
          "address": cityName
        });
    if (cityData != null) {
      double lat = cityData["results"].first["location"]["lat"];
      double long = cityData["results"].first["location"]["lng"];
      _getCityTemperature(lat, long, context);
    }
    emit(LocationLoaded());
  }

  Future<void> _getCityTemperature(
      double lat, double long, BuildContext context) async {
    context.read<HomeCubit>().getWeatherConditionOfLocation(lat, long);
  }
}
