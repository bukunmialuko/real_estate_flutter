import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/generated/assets.gen.dart';

class SendWidget extends StatelessWidget {
  const SendWidget({required this.scale, super.key});

  final Animation<double> scale;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: Container(
        width: 46.h,
        height: 46.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.3),
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: SizedBox(
          width: 14.w,
          height: 14.w,
          child: Assets.svg.paperPlaneRegular.svg(),
        ),
      ),
    );
  }
}
