import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/generated/assets.gen.dart';
import 'package:superapp/l10n/l10n.dart';

class ListOfVariantsWidget extends StatelessWidget {
  const ListOfVariantsWidget({required this.scale, super.key});
  final Animation<double> scale;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: Container(
        height: 42.h,
        padding: EdgeInsets.only(left: 14.w, right: 8.w),
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(42.h),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12.w,
              height: 12.w,
              margin: EdgeInsets.only(right: 6.w),
              child: Assets.svg.listSolid.svg(),
            ),
            Text(
              context.l10n.listOfVariants,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
