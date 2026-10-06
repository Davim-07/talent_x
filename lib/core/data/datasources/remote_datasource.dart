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
    // S'assure que l'ID est également inclus dans les données du document
    final dataToSave = Map<String, dynamic>.from(data);
    dataToSave['id'] = dataToSave['id'] ?? docId;

    await _firestore.collection(collectionPath).doc(docId).set(
          dataToSave,
          SetOptions(merge: true),
        );
  }

  /// Récupérer un document unique
  Future<Map<String, dynamic>?> getDocument({
    required String collectionPath,
    required String docId,
  }) async {
    final doc = await _firestore.collection(collectionPath).doc(docId).get();
    if (!doc.exists || doc.data() == null) return null;

    final data = Map<String, dynamic>.from(doc.data()!);
    data['id'] = data['id'] ?? doc.id;
    return data;
  }

  /// Récupérer tous les documents d'une collection
  Future<List<Map<String, dynamic>>> getCollection({
    required String collectionPath,
  }) async {
    final snapshot = await _firestore.collection(collectionPath).get();
    return snapshot.docs.map((doc) {
      final data = Map<String, dynamic>.from(doc.data());
      data['id'] = data['id'] ?? doc.id;
      return data;
    }).toList();
  }

  /// Écouter une collection en temps réel (Stream)
  Stream<List<Map<String, dynamic>>> watchCollection({
    required String collectionPath,
  }) {
    return _firestore.collection(collectionPath).snapshots().map(
          (snapshot) => snapshot.docs.map((doc) {
            final data = Map<String, dynamic>.from(doc.data());
            data['id'] = data['id'] ?? doc.id;
            return data;
          }).toList(),
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