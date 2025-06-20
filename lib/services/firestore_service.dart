import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> setData(String path, Map<String, dynamic> data) async {
    await _db.doc(path).set(data);
  }

  Future<void> updateData(String path, Map<String, dynamic> data) async {
    await _db.doc(path).update(data);
  }

  Future<void> deleteData(String path) async {
    await _db.doc(path).delete();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> documentStream(String path) {
    return _db.doc(path).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStream(String path) {
    return _db.collection(path).snapshots();
  }
}