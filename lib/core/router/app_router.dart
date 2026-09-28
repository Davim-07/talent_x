import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/catalog', 
  routes: [
    GoRoute(
      path: '/catalog',
      name: 'catalog',
      builder: (context, state) =>  const CatalogScreen()),
  ]);
