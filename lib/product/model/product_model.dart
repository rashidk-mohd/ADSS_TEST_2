// To parse this JSON data, do
//
//     final protectModel = protectModelFromJson(jsonString);

import 'dart:convert';

ProductModel protectModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String protectModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    List<Product> products;
    String? error;
    ProductModel({
        required this.products,
        this.error
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(json["Products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    int? id;
    String name;
    String category;
    double price;
    int stock;
    String description;

    Product({
        this.id,
        required this.name,
        required this.category,
        required this.price,
        required this.stock,
        required this.description,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["Name"],
        category: json["Category"],
        price: json["Price"]?.toDouble(),
        stock: json["Stock"],
        description: json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "Category": category,
        "Price": price,
        "Stock": stock,
        "Description": description,
    };
}
