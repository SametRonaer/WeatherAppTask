import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:step_front_task/helpers/constants.dart';
import 'package:step_front_task/helpers/network_service.dart';
import 'package:step_front_task/models/city_model.dart';
import 'package:step_front_task/models/country_model.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  List<CityModel> _cityList = [];
  List<CityModel> get cityList => _cityList;

  List<CountryModel> _countryList = [];
  List<CountryModel> get countryList => _countryList;

  CityModel? _currentCity;
  CityModel? get currentCity => _currentCity;

  Future<void> getAllCountries() async {
    emit(LocationLoading());
    final countriesData = await NetworkService.sendGetRequest(
        endPoint: "https://countriesnow.space/api/v0.1/countries/positions");
    _countryList = (countriesData["data"] as List<dynamic>)
        .map((e) => CountryModel.fromMap(e))
        .toList();
    _countryList.forEach(
      (element) => print(element.name),
    );

    emit(LocationLoaded());
  }

  Future<void> getCityLocation(String city) async {
    emit(LocationLoading());
    final cityData = await NetworkService.sendGetRequest(
        endPoint: "http://api.positionstack.com/v1/forward",
        queryParameters: {
          "access_key": kPositionApiKey,
          "query": city,
        });
    List<CityModel> foundedCities = (cityData["data"] as List<dynamic>)
        .map((e) => CityModel.fromMap(e))
        .toList();
    _detectCity(foundedCities, city);
  }

  _detectCity(List<CityModel> cities, String cityName) {
    _currentCity = cities.firstWhere((element) => element.name == cityName);
    print(_currentCity!.country);
    emit(LocationLoaded());
  }
}
