import '../services/firestore_service.dart';

abstract class FirestoreModel<T> {
  final FirestoreService _firestoreService = FirestoreService();

  String get collectionPath;

  T fromMap(Map<String, dynamic> map, String id);
  Map<String, dynamic> toMap();

  Future<void> create(String id, Map<String, dynamic> data) async {
    await _firestoreService.setData('$collectionPath/$id', data);
  }

  Future<void> update(String id, Map<String, dynamic> data) async {
    await _firestoreService.updateData('$collectionPath/$id', data);
  }

  Future<void> delete(String id) async {
    await _firestoreService.deleteData('$collectionPath/$id');
  }

  Stream<T?> getById(String id) {
    return _firestoreService
        .documentStream('$collectionPath/$id')
        .map((doc) => doc.exists ? fromMap(doc.data()!, doc.id) : null);
  }

  Stream<List<T>> getAll() {
    return _firestoreService
        .collectionStream(collectionPath)
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => fromMap(doc.data(), doc.id)).toList(),
        );
  }
}
