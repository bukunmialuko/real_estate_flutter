import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/generated/assets.gen.dart';

class UserLocationWidget extends StatefulWidget {
  const UserLocationWidget({super.key});

  @override
  State<UserLocationWidget> createState() => _UserLocationWidgetState();
}

class _UserLocationWidgetState extends State<UserLocationWidget> {
  bool expand = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          expand = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1700),
      // curve: Curves.easeInOut,
      width: expand ? 148.w : 0,
      height: 44.h,
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 2,
            spreadRadius: 0.3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 12.w,
            height: 12.h,
            child: Assets.svg.locationDotSolid.svg(
              colorFilter: const ColorFilter.mode(
                Color(0xff9f8d74),
                BlendMode.srcIn,
              ),
            ),
          ),
          8.horizontalSpace,
          Text(
            'Saint Petersburg',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              color: const Color(0xff9f8d74),
              height: 0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ).animate().fadeIn(delay: const Duration(milliseconds: 2200)),
    );
  }
}
