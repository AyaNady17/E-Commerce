import 'package:test/model/product_model.dart';
import 'package:test/services/firestore_services.dart';

abstract class DataBase {
  Stream<List<ProductModel>> salesProductsStream();
  Stream<List<ProductModel>> newProductsStream();
}

//!Further Development : create add product and delete product feature & query by category
class DataBaseController implements DataBase {
  final _service = FirestoreServices.instance;
  final userId;

  DataBaseController({required this.userId});
  @override
  Stream<List<ProductModel>> salesProductsStream() {
    return _service.collectionStream(
      path: '/products',
      builder: (data, docId) {
        return ProductModel.fromMap(data!, docId);
      },
      queryBuilder: (query) => query.where('discount', isNotEqualTo: 0),
    );
  }

  @override
  Stream<List<ProductModel>> newProductsStream() {
    return _service.collectionStream(
      path: '/products',
      builder: (data, docId) {
        return ProductModel.fromMap(data!, docId);
      },
    );
  }
}
