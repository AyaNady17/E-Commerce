// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddToCartModel {
  final String id;
  final String title;
  final int price;
  final int? discount;
  final String imageUrl;
  final String color;
  final String size;
  int quantity;
  final String productId;

  set Quantity(int q) {
    quantity = q;
  }

  AddToCartModel(
      {required this.id,
      required this.title,
      required this.price,
      this.discount = 0,
      required this.imageUrl,
      required this.color,
      required this.size,
      required this.quantity,
      required this.productId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'discount': discount,
      'imageUrl': imageUrl,
      'color': color,
      'size': size,
      'quantity': quantity,
      'productId': productId
    };
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map, String docId) {
    return AddToCartModel(
        id: docId,
        title: map['title'] as String,
        price: map['price'] as int,
        discount: map['discount'] != null ? map['discount'] as int : null,
        imageUrl: map['imageUrl'] as String,
        color: map['color'] as String,
        size: map['size'] as String,
        quantity: map['quantity'] as int,
        productId: map['productId']);
  }
}
