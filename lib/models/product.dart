import 'dart:convert';

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.places,
    required this.quantity,
    required this.category,
    required this.oPrice,
    required this.dPrice,
    this.favorite = false,
  });

  final String id;
  final String title;
  final String description;
  final String address;
  final int places;
  final String category;
  final String quantity;
  final int oPrice;
  final int dPrice;
  bool favorite;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        address: json['address'],
        quantity: json['quantity'],
        places: json['places'],
        category: json['category'],
        oPrice: json['oPrice'],
        dPrice: json['dPrice'],
        favorite: json['favorite'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'address': address,
        'places': places,
        'category': category,
        'quantity': quantity,
        'oPrice': oPrice,
        'dPrice': dPrice,
        'favorite': favorite,
      };

  @override
  String toString() =>
      'Product(id: $id, title: $title, description: $description, places: $places,quantity:$quantity, category: $category, address: $address, oPrice: $oPrice, dPrice: $dPrice, isFavorite: $favorite,)';
}
