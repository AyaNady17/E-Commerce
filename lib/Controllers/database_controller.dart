import 'package:test/model/add_to_cart_model.dart';
import 'package:test/model/product_model.dart';
import 'package:test/model/user_data.dart';
import 'package:test/services/firestore_services.dart';
import 'package:test/utils/api_paths.dart';

abstract class DataBase {
  Stream<List<ProductModel>> salesProductsStream();
  Stream<List<ProductModel>> newProductsStream();
  Future<void> setUserData(UserData userData);
  Future<void> addToCart(AddToCartModel addToCartModel);
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
}
