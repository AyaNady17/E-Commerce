import 'package:test/model/product_model.dart';
import 'package:test/services/firestore_services.dart';

abstract class DataBase {
  Stream<List<ProductModel>> productsStream();
}

class DataBaseController implements DataBase {
  final _service = FirestoreServices.instrance;

  @override
  Stream<List<ProductModel>> productsStream() {
    return _service.collectionStream(
        path: 'products/',
        builder: (data, docId) {
          return ProductModel.fromMap(data!, docId);
        });
  }
}
