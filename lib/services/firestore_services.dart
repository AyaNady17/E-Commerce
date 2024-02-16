import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  FirestoreServices._();
  static final instance = FirestoreServices._();
  final _firestore = FirebaseFirestore.instance;
  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    final reference = _firestore.doc(path);
    await reference.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = _firestore.doc(path);
    await reference.delete();
  }

  Stream<T> documentStream<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String docID) builder}) {
    final reference = _firestore.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }
  //*snapshots.map *Transforms each element of this stream into a specific object model.

  Stream<List<T>> collectionStream<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String documentId)
          builder,
      Query Function(Query query)? queryBuilder,
      int Function(T lhs, T rhs)? sort}) {
    Query query =
        _firestore.collection(path); //a3mel query للكل all collections
    if (queryBuilder != null) {
      //لو ال querybuilder اللى جاى من بره ملبان يعنى عايزين نستعلم عن شىء معين
      query = queryBuilder(
          query); //خد query for all collection مرره بالqueryBuilder والنتيجة حطها فى ال object query من نوع َQuery
    }
    final snapshots = query.snapshots();
    return snapshots.map(
      (snapshot /*one collection*/) {
        final result = snapshot.docs
            .map(
              (snapshot /*one document*/) {
                return builder(
                  snapshot.data() as Map<String, dynamic>,
                  snapshot.id,
                );
              },
            )
            .where((value) => value != null)
            .toList();
        if (sort != null) {
          result.sort(sort);
        }
        return result;
      },
    );
  }
}
