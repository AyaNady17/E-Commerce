import 'package:test/utils/app_assets.dart';

class ProductModel {
  final String title;
  final String category;
  final double price;
  final int discount;
  final String imageUrl;

  ProductModel({
    required this.title,
    required this.category,
    required this.price,
    this.discount = 0,
    required this.imageUrl,
  });
}

List<ProductModel> dummyProducts = [
  ProductModel(
    title: 'Cotton Pullover',
    category: 'Men Wear',
    price: 20.0,
    discount: 20,
    imageUrl: AppAssets.tempProductAsset1,
  ),
  ProductModel(
      title: 'Cotton Pullover',
      category: 'Men Wear',
      price: 20.0,
      discount: 20,
      imageUrl: AppAssets.tempProductAsset1),
  ProductModel(
      title: 'Cotton Pullover',
      category: 'Men Wear',
      price: 20.0,
      discount: 20,
      imageUrl: AppAssets.tempProductAsset1),
  ProductModel(
      title: 'Cotton Pullover',
      category: 'Men Wear',
      price: 20.0,
      discount: 20,
      imageUrl: AppAssets.tempProductAsset1),
  ProductModel(
      title: 'Cotton Pullover',
      category: 'Men Wear',
      price: 20.0,
      discount: 20,
      imageUrl: AppAssets.tempProductAsset1),
];
