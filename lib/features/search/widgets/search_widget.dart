import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/generated/assets.gen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({required this.scale, super.key});

  final Animation<double> scale;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: Container(
        width: 200,
        height: 46.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48.h),
          color: AppColors.white,
        ),
        padding: EdgeInsets.only(left: 16.w, right: 8.w),
        child: Row(
          children: [
            Container(
              width: 16.w,
              height: 16.w,
              margin: EdgeInsets.only(right: 8.w),
              child: Assets.svg.listSolid.svg(
                colorFilter: const ColorFilter.mode(
                  AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const Expanded(
              child: Text(
                'Saint Petersburg',
                style: TextStyle(
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
