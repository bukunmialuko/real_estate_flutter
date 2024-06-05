import 'package:superapp/core/navigation/path/base/nav_path.dart';
import 'package:superapp/core/navigation/path/base/nav_route.dart';

class HomeNavPath extends NavPath<String> {
  const HomeNavPath();

  @override
  String get urlPattern => '/home';

  NavRoute<String> route() => NavRoute(path: urlPattern);
}
