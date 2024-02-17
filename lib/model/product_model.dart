import 'package:test/utils/app_assets.dart';

class ProductModel {
  final String id;
  final String title;
  final String category;
  final int price;
  final int? discount;
  final String imageUrl;
  final int? rate;
  final String brandName;

  ProductModel(
      {required this.brandName,
      required this.id,
      required this.title,
      required this.category,
      required this.price,
      this.discount = 0,
      required this.imageUrl,
      this.rate});

  factory ProductModel.fromMap(Map<String, dynamic> map, String docId) {
    return ProductModel(
      brandName: map['brandName'],
      id: docId,
      title: map["title"],
      category: map["category"],
      price: map["price"],
      imageUrl: map["imageUrl"],
      discount: map['discount'],
      rate: map['rate'],
    );
  }
}

// List<ProductModel> dummyProducts = [
//   ProductModel(
//     id: '1',
//     title: 'Cotton Pullover',
//     category: 'Men Wear',
//     price: 20,
//     discount: 20,
//     imageUrl: 'https://m.media-amazon.com/images/I/61-jBuhtgZL._UX569_.jpg',
//   ),
//   ProductModel(
//       id: '1',
//       title: 'Cotton Pullover',
//       category: 'Men Wear',
//       price: 20,
//       discount: 20,
//       imageUrl: AppAssets.tempProductAsset1),
//   ProductModel(
//       id: '1',
//       title: 'Cotton Pullover',
//       category: 'Men Wear',
//       price: 20,
//       discount: 20,
//       imageUrl: AppAssets.tempProductAsset1),
//   ProductModel(
//       id: '1',
//       title: 'Cotton Pullover',
//       category: 'Men Wear',
//       price: 20,
//       discount: 20,
//       imageUrl: AppAssets.tempProductAsset1),
//   ProductModel(
//       id: '1',
//       title: 'Cotton Pullover',
//       category: 'Men Wear',
//       price: 20,
//       discount: 20,
//       imageUrl: AppAssets.tempProductAsset1),
// ];
