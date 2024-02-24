import 'dart:ffi';

import 'package:test/model/add_to_cart_model.dart';
import 'package:test/model/product_model.dart';
import 'package:test/model/user_data.dart';
import 'package:test/services/firestore_services.dart';
import 'package:test/utils/api_paths.dart';

abstract class DataBase {
  Stream<List<ProductModel>> salesProductsStream();
  Stream<List<ProductModel>> newProductsStream();
  Stream<List<AddToCartModel>> myProductsCart();
  Future<void> setUserData(UserData userData);
  Future<void> addToCart(AddToCartModel addToCartModel);
  Future<void> deleteCartItem(String docId);
  Future<void> updateCartItemQuantity(String docId, int quantity);

  Future<void> updateCartTotalAmount(int amount);
  // Future<int> getCartTotalAmount();
}

//!Further Development : create add product and delete product feature & query by category
class DataBaseController implements DataBase {
  final _service = FirestoreServices.instance;
  final String userId;

  DataBaseController(this.userId);
  @override
  Stream<List<ProductModel>> salesProductsStream() {
    return _service.collectionStream(
      path: ApiPath.products(),
      builder: (data, docId) {
        return ProductModel.fromMap(data!, docId);
      },
      queryBuilder: (query) => query.where('discount', isNotEqualTo: 0),
    );
  }

  @override
  Stream<List<ProductModel>> newProductsStream() {
    return _service.collectionStream(
      path: ApiPath.products(),
      builder: (data, docId) {
        return ProductModel.fromMap(data!, docId);
      },
    );
  }

  @override
  Future<void> setUserData(UserData userData) async {
    await _service.setData(path: ApiPath.user(userId), data: userData.toMap());
    print("set user id : $userId");
  }

  @override
  Future<void> addToCart(AddToCartModel addToCartModel) async {
    await _service.setData(
        path: ApiPath.addToCart(userId, addToCartModel.id),
        data: addToCartModel.toMap());
    print("add to cart user id : $userId");
  }

  @override
  Stream<List<AddToCartModel>> myProductsCart() {
    return _service.collectionStream(
        path: ApiPath.myProductsCart(userId),
        builder: (data, docId) {
          return AddToCartModel.fromMap(data!, docId);
        });
  }

  @override
  Future<void> deleteCartItem(String docId) async {
    await _service.deleteData(path: ApiPath.addToCart(userId, docId));
  }

  @override
  Future<void> updateCartItemQuantity(String docId, int quantity) async {
    await _service.updateData(
        path: ApiPath.addToCart(userId, docId), data: {"quantity": quantity});
  }

  @override
  Future<void> updateCartTotalAmount(int amount) async {
    await _service
        .updateData(path: ApiPath.user(userId), data: {"totalAmount": amount});
  }

  // @override
  // Future<int> getCartTotalAmount() async{
  //  await _service.
  // }
}
