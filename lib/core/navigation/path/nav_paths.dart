import 'package:superapp/core/navigation/path/paths/home/home_nav_path.dart';
import 'package:superapp/core/navigation/path/paths/search/search_nav_path.dart';
import 'package:superapp/core/navigation/path/paths/splash_nav_path.dart';

class NavPaths {
  NavPaths._();

  static const splash = SplashNavPath();

  /// home
  static const home = HomeNavPath();

  /// Search
  static const search = SearchNavPath();
}
