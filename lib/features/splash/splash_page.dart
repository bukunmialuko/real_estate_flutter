import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superapp/core/navigation/path/nav_paths.dart';
import 'package:superapp/generated/assets.gen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animationController
      ..forward()
      ..addStatusListener(animationListener);
  }

  void animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      context.go(NavPaths.home.route().path);
    }
  }

  @override
  void dispose() {
    _animationController
      ..removeStatusListener(animationListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Assets.animation.homeButton.lottie(
              controller: _animationController,
            ),
          ),
        ],
      ),
    );
  }
}
