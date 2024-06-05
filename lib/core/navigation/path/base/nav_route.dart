import 'package:equatable/equatable.dart';

class NavRoute<T> extends Equatable {
  const NavRoute({required this.path, this.extra});

  final String path;

  /// an extra parameter for `go_router`
  /// @link: https://gorouter.dev/parameters
  final T? extra;

  @override
  List<Object?> get props => [path, extra];
}
