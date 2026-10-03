import 'package:flutter/material.dart';

import 'package:talent_x/artist_app/core/theme/providers/theme_provider.dart';
import 'package:talent_x/artist_app/core/theme/app_theme.dart';
import 'package:talent_x/app/router/app_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'TalentX',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: appRouter,
    );
  }
}
