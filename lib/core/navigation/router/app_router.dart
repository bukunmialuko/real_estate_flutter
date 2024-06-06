import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superapp/core/navigation/path/nav_paths.dart';
import 'package:superapp/features/home/home_page.dart';
import 'package:superapp/features/home/root_page.dart';
import 'package:superapp/features/search/search_page.dart';
import 'package:superapp/features/splash/splash_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppModuleRouter {
  const AppModuleRouter();

  GoRouter createApplicationRouter() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: NavPaths.splash.urlPattern,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: NavPaths.splash.urlPattern,
          builder: (context, state) => const SplashPage(),
        ),

        /// Home / Root
        ShellRoute(
          parentNavigatorKey: _rootNavigatorKey,
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => RootPage(child: child),
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: NavPaths.home.urlPattern,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: NavPaths.search.urlPattern,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SearchPage()),
            ),
          ],
        ),
      ],
      errorBuilder: (context, __) {
        return const Scaffold(
          body: Center(
            child: Text('Page Not Found'),
          ),
        );
      },
    );
  }
}
