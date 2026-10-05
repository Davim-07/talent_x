
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRemoteDataSource {
  final FirebaseFirestore _firestore;

  FirestoreRemoteDataSource({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Créer ou mettre à jour un document dans une collection
  Future<void> setDocument({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collectionPath).doc(docId).set(
          data,
          SetOptions(merge: true),
        );
  }

  /// Récupérer un document
  Future<Map<String, dynamic>?> getDocument({
    required String collectionPath,
    required String docId,
  }) async {
    final doc = await _firestore.collection(collectionPath).doc(docId).get();
    return doc.data();
  }

  /// Récupérer tous les documents d'une collection
  Future<List<Map<String, dynamic>>> getCollection({
    required String collectionPath,
  }) async {
    final snapshot = await _firestore.collection(collectionPath).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Écouter une collection en temps réel (Stream)
  Stream<List<Map<String, dynamic>>> watchCollection({
    required String collectionPath,
  }) {
    return _firestore.collection(collectionPath).snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
        );
  }

  /// Supprimer un document
  Future<void> deleteDocument({
    required String collectionPath,
    required String docId,
  }) async {
    await _firestore.collection(collectionPath).doc(docId).delete();
  }
}