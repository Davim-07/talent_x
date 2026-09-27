import 'package:go_router/go_router.dart';

import 'package:talent_x/features/catalog/presentation/pages/home_catalog_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/catalog',
  routes: [
    GoRoute(
      path: '/catalog',
      name: 'catalog',
      builder: (context, state) => CatalogScreen(),
    ),
  ],
);
