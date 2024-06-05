import 'package:superapp/core/navigation/path/base/nav_path.dart';
import 'package:superapp/core/navigation/path/base/nav_route.dart';

class SearchNavPath extends NavPath<String> {
  const SearchNavPath();

  @override
  String get urlPattern => '/search';

  NavRoute<String> route() => NavRoute(path: urlPattern);
}
