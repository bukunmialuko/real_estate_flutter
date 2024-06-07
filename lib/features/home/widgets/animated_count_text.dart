import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AnimatedCountText extends StatefulWidget {
  const AnimatedCountText({
    required this.countEnd,
    required this.textColor,
    super.key,
  });
  final double countEnd;
  final Color textColor;

  @override
  State<AnimatedCountText> createState() => AnimatedCountTextState();
}

class AnimatedCountTextState extends State<AnimatedCountText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final NumberFormat _numberFormat = NumberFormat('#,##0', 'en_US');

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1400,
      ),
    );

    _animation =
        Tween<double>(begin: 0, end: widget.countEnd).animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        _controller.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatNumber(double value) {
    final formatted = _numberFormat.format(value);
    return formatted.replaceAll(',', ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatNumber(_animation.value),
      style: TextStyle(
        fontSize: 34.sp,
        fontWeight: FontWeight.w600,
        color: widget.textColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
