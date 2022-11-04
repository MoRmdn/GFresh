// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<UserLocation> locationFromJson(String str) => List<UserLocation>.from(
    json.decode(str).map((x) => UserLocation.fromJson(x)));

String locationToJson(List<UserLocation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLocation {
  UserLocation({
    required this.location,
    required this.name,
    this.latitude,
    this.longitude,
  });

  final String location;
  final String name;
  String? latitude;
  String? longitude;

  factory UserLocation.fromJson(Map<String, dynamic> json) => UserLocation(
        location: json["location"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
      };
  @override
  String toString() => {
        "name": name,
        "location": location,
        "longitude": longitude,
        "latitude": latitude,
      }.toString();
}
