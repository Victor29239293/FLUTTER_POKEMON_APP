import 'package:go_router/go_router.dart';

import '../../presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [],
    ),
    // Define your app routes here
    GoRoute(path: '/', redirect: (_, __) => '/home/0'),
  ],
);
