import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_app/presentation/pages/login_page.dart';
import 'auth_app/presentation/pages/register_page.dart';
import 'admin_app/presentation/pages/admin_main_page.dart';
import 'jury_app/presentation/pages/jury_dashboard_page.dart';

// 1. L'IMPORT DE L'ARTISTE
import 'artist_app/presentation/pages/artist_main_scaffold.dart';

void main() {
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

        // 2. UTILISATION DU COMPOSANT (C'est cette ligne qui résout le problème de l'import non utilisé !)
        '/artist_app': (context) => const ArtistMainScaffold(),
      },
    );
  }
}