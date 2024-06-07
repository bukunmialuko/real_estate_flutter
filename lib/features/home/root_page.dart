import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superapp/core/navigation/path/nav_paths.dart';
import 'package:superapp/features/home/widgets/bottom_nav/custom_bottom_nav_bar.dart';
import 'package:superapp/generated/assets.gen.dart';

class RootPage extends StatefulWidget {
  const RootPage({required this.child, super.key});

  final Widget child;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.child,
      bottomNavigationBar: CustomBottomNavBar(
        items: [
          Assets.svg.search.svg(key: const Key('svg_search')),
          Assets.svg.messageSolid.svg(),
          Assets.svg.houseSolid.svg(),
          Assets.svg.heartSolid.svg(),
          Assets.svg.userSolid.svg(),
        ],
        onTap: navigate,
        currentIndex: _calculateCurrentIndex(context),
      ),
    );
  }

  void navigate(int value) {
    if (value == 0) {
      context.go(NavPaths.search.urlPattern);
    }
    if (value == 2) {
      context.go(NavPaths.home.urlPattern);
    }
  }

  static int _calculateCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith(NavPaths.search.urlPattern)) {
      return 0;
    }

    if (location.startsWith(NavPaths.home.urlPattern)) {
      return 2;
    }

    return 0;
  }
}
