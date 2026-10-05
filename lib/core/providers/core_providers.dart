import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talent_x/core/data/datasources/local_datasource.dart';
import 'package:talent_x/core/data/datasources/remote_datasource.dart';
import 'package:talent_x/core/utils/isar_service.dart';

/// Instance de la base locale Isar
final isarServiceProvider = Provider<IsarService>((ref) {
  return IsarService.instance;
});

/// Source de données locale Isar
final localDataSourceProvider = Provider<IsarLocalDataSource>((ref) {
  final isarService = ref.watch(isarServiceProvider);
  return IsarLocalDataSource(isarService);
});

/// Source de données distante Cloud Firestore
final remoteDataSourceProvider = Provider<FirestoreRemoteDataSource>((ref) {
  return FirestoreRemoteDataSource();
});
