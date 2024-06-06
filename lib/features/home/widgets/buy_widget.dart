import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/features/home/widgets/animated_count_text.dart';
import 'package:superapp/l10n/l10n.dart';

class BuyWidget extends StatelessWidget {
  const BuyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 160.w,
      decoration: const BoxDecoration(
        color: AppColors.lightOrange,
        shape: BoxShape.circle,
      ),
      child: Column(
        children: [
          12.verticalSpace,
          Text(
            context.l10n.buy,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
              height: 0,
            ),
            textAlign: TextAlign.center,
          ),
          28.verticalSpace,
          const AnimatedCountText(
            countEnd: 1034,
            textColor: AppColors.white,
          ),
          2.verticalSpace,
          Text(
            context.l10n.offers,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
              height: 0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    )
        .animate(delay: const Duration(milliseconds: 2000))
        .scale(duration: const Duration(milliseconds: 3000));
  }
}
