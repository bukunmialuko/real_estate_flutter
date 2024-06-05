import 'package:superapp/core/navigation/path/base/nav_path.dart';
import 'package:superapp/core/navigation/path/base/nav_route.dart';

class SplashNavPath extends NavPath<String> {
  const SplashNavPath();

  @override
  String get urlPattern => '/';

  NavRoute<String> route() => NavRoute(path: urlPattern);
}
