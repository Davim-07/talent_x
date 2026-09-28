import 'package:go_router/go_router.dart';
import 'package:talent_x/features/vote/presentation/pages/vote_page.dart';

import 'package:talent_x/features/catalog/presentation/pages/home_catalog_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/catalog',
  routes: [
    GoRoute(
      path: '/catalog',
      name: 'catalog',
      builder: (context, state) => const CatalogScreen()),
    GoRoute(
      path: '/vote',
      name: 'vote',
      builder: (context , state) => const VotePage(),
    )
  ]);
 
