import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp/core/styling/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    required this.items,
    required this.onTap,
    required this.currentIndex,
    super.key,
  });

  final List<Widget> items;
  final void Function(int) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60.h,
        color: Colors.transparent,
        margin: EdgeInsets.only(bottom: Platform.isAndroid ? 10.h : 4.h),
        child: Center(
          child: Container(
            width: 266.w,
            decoration: BoxDecoration(
              color: AppColors.darkCarton.withOpacity(0.95),
              borderRadius: BorderRadius.circular(60.h),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < items.length; i++) ...[
                  _NavItem(
                    icon: items[i],
                    currentIndex: currentIndex,
                    index: i,
                    onTap: onTap,
                  ),
                ],
              ],
            ),
          ),
        ),
      ).animate().slideY(
            delay: const Duration(milliseconds: 5000),
            duration: const Duration(milliseconds: 2000),
            begin: 5,
            end: 0,
            curve: Curves.easeIn,
          ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.currentIndex,
    required this.index,
    required this.onTap,
  });

  final int index;
  final void Function(int) onTap;
  final Widget icon;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Container(
        width: 52.w,
        height: 58.h,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              width: currentIndex == index ? 50.w : 42.w,
              height: currentIndex == index ? 50.h : 42.w,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? AppColors.darkOrange
                    : AppColors.darkCarton,
                shape: BoxShape.circle,
              ),
              duration: const Duration(milliseconds: 300),
            ),
            Center(
              child: SizedBox(
                width: 18.w,
                height: 18.h,
                child: icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
