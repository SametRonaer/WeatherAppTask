// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CountryModel {
  String name;
  String iso2;
  dynamic long;
  dynamic lat;
  CountryModel({
    required this.name,
    required this.iso2,
    required this.long,
    required this.lat,
  });

  CountryModel copyWith({
    String? name,
    String? iso2,
    dynamic? long,
    dynamic? lat,
  }) {
    return CountryModel(
      name: name ?? this.name,
      iso2: iso2 ?? this.iso2,
      long: long ?? this.long,
      lat: lat ?? this.lat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'iso2': iso2,
      'long': long,
      'lat': lat,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      name: map['name'] as String,
      iso2: map['iso2'] as String,
      long: map['long'] as dynamic,
      lat: map['lat'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryModel(name: $name, iso2: $iso2, long: $long, lat: $lat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CountryModel &&
        other.name == name &&
        other.iso2 == iso2 &&
        other.long == long &&
        other.lat == lat;
  }

  @override
  int get hashCode {
    return name.hashCode ^ iso2.hashCode ^ long.hashCode ^ lat.hashCode;
  }
}
