// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class CountryModel {
  String country;
  String iso2;
  String iso3;
  List<dynamic> cities;
  CountryModel({
    required this.country,
    required this.iso2,
    required this.iso3,
    required this.cities,
  });

  CountryModel copyWith({
    String? country,
    String? iso2,
    String? iso3,
    List<String>? cities,
  }) {
    return CountryModel(
      country: country ?? this.country,
      iso2: iso2 ?? this.iso2,
      iso3: iso3 ?? this.iso3,
      cities: cities ?? this.cities,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'iso2': iso2,
      'iso3': iso3,
      'cities': cities,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      country: map['country'] as String,
      iso2: map['iso2'] as String,
      iso3: map['iso3'] as String,
      cities: List<String>.from((map['cities'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryModel(country: $country, iso2: $iso2, iso3: $iso3, cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is CountryModel &&
        other.country == country &&
        other.iso2 == iso2 &&
        other.iso3 == iso3 &&
        listEquals(other.cities, cities);
  }

  @override
  int get hashCode {
    return country.hashCode ^ iso2.hashCode ^ iso3.hashCode ^ cities.hashCode;
  }
}
