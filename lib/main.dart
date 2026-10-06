import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'admin_app/presentation/pages/admin_main_page.dart';
import 'artist_app/presentation/pages/artist_main_scaffold.dart';
import 'auth_app/presentation/pages/login_page.dart';
import 'auth_app/presentation/pages/register_page.dart';
import 'core/data/datasources/local_datasource.dart';
import 'core/data/datasources/remote_datasource.dart';
import 'core/data/repositories/artist_repository_impl.dart';
import 'core/data/repositories/big_event_repository_impl.dart';
import 'core/data/repositories/competition_repository_impl.dart';
import 'core/data/repositories/vote_repository_impl.dart';
import 'core/utils/database_seeder.dart';
import 'core/utils/firestore_seeder.dart'; // Import du seeder Firestore
import 'core/utils/isar_service.dart';
import 'firebase_options.dart';
import 'jury_app/presentation/pages/jury_dashboard_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialisation Firebase & Seeding Firestore Remote
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Injection des données de test dans Firestore
    await FirestoreSeeder.seedTestData();
    debugPrint('✅ FirestoreSeeder exécuté avec succès !');
  } catch (e) {
    debugPrint('Avertissement Firebase / FirestoreSeeder: $e');
  }

  // 2. Initialisation Isar DB
  try {
    await IsarService.init();

    // 3. Amorçage des données Isar locales si vide
    final localDS = IsarLocalDataSource(IsarService.instance);
    final remoteDS = FirestoreRemoteDataSource();
    final compRepo =
        CompetitionRepositoryImpl(localDS: localDS, remoteDS: remoteDS);
    final artistRepo =
        ArtistRepositoryImpl(localDS: localDS, remoteDS: remoteDS);
    final bigEventRepo =
        BigEventRepositoryImpl(localDS: localDS, remoteDS: remoteDS);
    final voteRepo =
        VoteRepositoryImpl(localDS: localDS, remoteDS: remoteDS);

    DatabaseSeeder.seedIfEmpty(
      competitionRepo: compRepo,
      artistRepo: artistRepo,
      bigEventRepo: bigEventRepo,
      voteRepo: voteRepo,
    );
  } catch (e) {
    debugPrint('Avertissement Isar / Seeder: $e');
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TalentX',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/jury_app': (context) => const JuryDashboardPage(),
        '/admin_app': (context) => const AdminMainPage(),
        '/artist_app': (context) => const ArtistMainScaffold(),
      },
    );
  }
}