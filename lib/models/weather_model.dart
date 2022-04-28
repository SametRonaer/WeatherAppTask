// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WeatherModel weatherModelFromMap(String str) =>
    WeatherModel.fromMap(json.decode(str));

class WeatherModel {
  WeatherModel({
    @required this.coord,
    @required this.weather,
    @required this.base,
    @required this.main,
    @required this.visibility,
    @required this.wind,
    @required this.clouds,
    @required this.dt,
    @required this.sys,
    @required this.timezone,
    @required this.id,
    @required this.name,
    @required this.cod,
  });

  Coord? coord;
  List<Weather>? weather;
  String? base;
  String? name;
  Main? main;
  Sys? sys;
  Wind? wind;
  Clouds? clouds;
  int? visibility;
  int? dt;
  int? timezone;
  int? id;
  int? cod;

  factory WeatherModel.fromMap(Map<String, dynamic> json) => WeatherModel(
        coord: json["coord"] == null ? null : Coord.fromMap(json["coord"]),
        weather: json["weather"] == null
            ? null
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromMap(x))),
        base: json["base"] == null ? null : json["base"],
        main: json["main"] == null ? null : Main.fromMap(json["main"]),
        visibility: json["visibility"] == null ? null : json["visibility"],
        wind: json["wind"] == null ? null : Wind.fromMap(json["wind"]),
        clouds: json["clouds"] == null ? null : Clouds.fromMap(json["clouds"]),
        dt: json["dt"] == null ? null : json["dt"],
        sys: json["sys"] == null ? null : Sys.fromMap(json["sys"]),
        timezone: json["timezone"] == null ? null : json["timezone"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        cod: json["cod"] == null ? null : json["cod"],
      );
}

class Clouds {
  Clouds({
    @required this.all,
  });

  int? all;

  factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
        all: json["all"] == null ? null : json["all"],
      );

  Map<String, dynamic> toMap() => {
        "all": all == null ? null : all,
      };
}

class Coord {
  Coord({
    @required this.lon,
    @required this.lat,
  });

  double? lon;
  double? lat;

  factory Coord.fromMap(Map<String, dynamic> json) => Coord(
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lon": lon == null ? null : lon,
        "lat": lat == null ? null : lat,
      };
}

class Main {
  Main({
    @required this.temp,
    @required this.feelsLike,
    @required this.tempMin,
    @required this.tempMax,
    @required this.pressure,
    @required this.humidity,
    @required this.seaLevel,
    @required this.grndLevel,
  });

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  factory Main.fromMap(Map<String, dynamic> json) => Main(
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        feelsLike:
            json["feels_like"] == null ? null : json["feels_like"].toDouble(),
        tempMin: json["temp_min"] == null ? null : json["temp_min"].toDouble(),
        tempMax: json["temp_max"] == null ? null : json["temp_max"].toDouble(),
        pressure: json["pressure"] == null ? null : json["pressure"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        seaLevel: json["sea_level"] == null ? null : json["sea_level"],
        grndLevel: json["grnd_level"] == null ? null : json["grnd_level"],
      );

  Map<String, dynamic> toMap() => {
        "temp": temp == null ? null : temp,
        "feels_like": feelsLike == null ? null : feelsLike,
        "temp_min": tempMin == null ? null : tempMin,
        "temp_max": tempMax == null ? null : tempMax,
        "pressure": pressure == null ? null : pressure,
        "humidity": humidity == null ? null : humidity,
        "sea_level": seaLevel == null ? null : seaLevel,
        "grnd_level": grndLevel == null ? null : grndLevel,
      };
}

class Sys {
  Sys({
    @required this.type,
    @required this.id,
    @required this.country,
    @required this.sunrise,
    @required this.sunset,
  });

  String? country;
  int? type;
  int? id;
  int? sunrise;
  int? sunset;

  factory Sys.fromMap(Map<String, dynamic> json) => Sys(
        type: json["type"] == null ? null : json["type"],
        id: json["id"] == null ? null : json["id"],
        country: json["country"] == null ? null : json["country"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
      );

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : type,
        "id": id == null ? null : id,
        "country": country == null ? null : country,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
      };
}

class Weather {
  Weather({
    @required this.id,
    @required this.main,
    @required this.description,
    @required this.icon,
  });

  int? id;
  String? main;
  String? description;
  String? icon;

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"] == null ? null : json["id"],
        main: json["main"] == null ? null : json["main"],
        description: json["description"] == null ? null : json["description"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "main": main == null ? null : main,
        "description": description == null ? null : description,
        "icon": icon == null ? null : icon,
      };
}

class Wind {
  Wind({
    @required this.speed,
    @required this.deg,
    @required this.gust,
  });

  double? speed;
  int? deg;
  double? gust;

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"] == null ? null : json["speed"].toDouble(),
        deg: json["deg"] == null ? null : json["deg"],
        gust: json["gust"] == null ? null : json["gust"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "speed": speed == null ? null : speed,
        "deg": deg == null ? null : deg,
        "gust": gust == null ? null : gust,
      };
}
