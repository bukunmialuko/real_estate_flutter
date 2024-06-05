import 'package:go_router/go_router.dart';

abstract class NavPath<T> {
  const NavPath();

  /// `go_router` definition for path
  /// @link: https://gorouter.dev/declarative-routing
  String get urlPattern;

  T? parseToRoute(GoRouterState state) {
    return state.extra as T;
  }
}
