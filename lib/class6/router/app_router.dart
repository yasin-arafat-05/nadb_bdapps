import 'package:go_router/go_router.dart';

class AppRouter {
  static const splash = '/';
  static const home = '/home';
  static const quiz = '/quiz';
  static const result = '/result';
  // static const profile = '/profile';
  final appRouter = GoRouter(routes: [GoRoute(path: splash)]);
}
