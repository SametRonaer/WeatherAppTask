import 'package:flutter/foundation.dart';

class CityModel {
  CityModel({
    @required this.latitude,
    @required this.longitude,
    @required this.type,
    @required this.name,
    @required this.number,
    @required this.postalCode,
    @required this.street,
    @required this.confidence,
    @required this.region,
    @required this.regionCode,
    @required this.county,
    @required this.locality,
    @required this.administrativeArea,
    @required this.neighbourhood,
    @required this.country,
    @required this.countryCode,
    @required this.continent,
    @required this.label,
  });

  double? latitude;
  double? longitude;
  String? type;
  String? name;
  dynamic number;
  dynamic postalCode;
  dynamic street;
  double? confidence;
  String? region;
  String? regionCode;
  String? county;
  String? locality;
  String? administrativeArea;
  String? neighbourhood;
  String? country;
  String? countryCode;
  String? continent;
  String? label;

  factory CityModel.fromMap(Map<String, dynamic> json) => CityModel(
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        type: json["type"] == null ? null : json["type"],
        name: json["name"] == null ? null : json["name"],
        number: json["number"],
        postalCode: json["postal_code"],
        street: json["street"],
        confidence:
            json["confidence"] == null ? null : json["confidence"].toDouble(),
        region: json["region"] == null ? null : json["region"],
        regionCode: json["region_code"] == null ? null : json["region_code"],
        county: json["county"] == null ? null : json["county"],
        locality: json["locality"] == null ? null : json["locality"],
        administrativeArea: json["administrative_area"] == null
            ? null
            : json["administrative_area"],
        neighbourhood:
            json["neighbourhood"] == null ? null : json["neighbourhood"],
        country: json["country"] == null ? null : json["country"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        continent: json["continent"] == null ? null : json["continent"],
        label: json["label"] == null ? null : json["label"],
      );

  Map<String, dynamic> toMap() => {
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "type": type == null ? null : type,
        "name": name == null ? null : name,
        "number": number,
        "postal_code": postalCode,
        "street": street,
        "confidence": confidence == null ? null : confidence,
        "region": region == null ? null : region,
        "region_code": regionCode == null ? null : regionCode,
        "county": county == null ? null : county,
        "locality": locality == null ? null : locality,
        "administrative_area":
            administrativeArea == null ? null : administrativeArea,
        "neighbourhood": neighbourhood == null ? null : neighbourhood,
        "country": country == null ? null : country,
        "country_code": countryCode == null ? null : countryCode,
        "continent": continent == null ? null : continent,
        "label": label == null ? null : label,
      };
}
