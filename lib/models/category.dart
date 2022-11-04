// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<AppCategory> catFromJson(String str) => List<AppCategory>.from(
    json.decode(str).map((x) => AppCategory.fromJson(x)));

String catToJson(List<AppCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppCategory {
  AppCategory({
    required this.title,
    required this.id,
    required this.imageUrl,
  });

  final String title;
  final String id;
  final String imageUrl;

  factory AppCategory.fromJson(Map<String, dynamic> json) => AppCategory(
        title: json["title"],
        id: json["id"],
        imageUrl: json["imageURL"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "imageURL": imageUrl,
      };

  @override
  String toString() => {
        'id': id,
        'title': title,
        'imageURL': imageUrl,
      }.toString();
}
