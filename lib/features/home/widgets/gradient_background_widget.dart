import 'package:flutter/material.dart';

class GradientBackgroundWidget extends StatelessWidget {
  const GradientBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.centerRight,
          radius: 1.3,
          colors: [
            Color(0xFFf9e1c4), Color(0xFFFFFFFF), // White color
          ],
        ),
      ),
    );
  }
}
