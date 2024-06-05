import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superapp/core/navigation/path/nav_paths.dart';

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
          builder: (context, state) => Container(),
        ),

        /// Home / Root
        ShellRoute(
          parentNavigatorKey: _rootNavigatorKey,
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => Container(),
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: NavPaths.home.urlPattern,
              pageBuilder: (context, state) => NoTransitionPage(
                child: Container(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: NavPaths.search.urlPattern,
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: Container()),
            ),
          ],
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) async {
        // Always show splash on resume app
        if (state.fullPath != null &&
            state.fullPath != NavPaths.splash.urlPattern) {
          // final user = GetIt.I.get<IAuthService>().currentUser();
          // if (user == null) {
          //   return NavPaths.signIn.urlPattern;
          // }
        }

        return null;
      },
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
