import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../apps/artist/artist_shell.dart';

// Mock du Provider Auth pour le socle (à relier à Firebase Auth)
final authRoleProvider = StateProvider<String?>((ref) => 'artist');

final routerProvider = Provider<GoRouter>((ref) {
  final role = ref.watch(authRoleProvider);

  return GoRouter(
    initialLocation: '/artist/catalog',
    redirect: (context, state) {
      if (role == null) return '/login';
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Page de Connexion / Inscription')),
        ),
      ),
      GoRoute(
        path: '/artist/catalog',
        builder: (context, state) => const ArtistShell(),
      ),
      GoRoute(
        path: '/jury',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Espace Évaluation Jury')),
        ),
      ),
      GoRoute(
        path: '/admin',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Tableau de Bord Admin Web')),
        ),
      ),
    ],
  );
});