import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/generated/assets.gen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: () {
            debugPrint('tappable');
          },
          child: Container(
            color: AppColors.black,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            // color: AppColors.white,
            /// Note: Its common for search to be done in another UI
            child: SafeArea(
              bottom: false,
              child: Container(
                margin: EdgeInsets.only(
                  left: 32.w,
                  right: 32.w,
                  top: 10.h,
                ),
                child: Row(
                  children: [
                    Expanded(
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
                    ),
                    SizedBox(width: 16.w),
                    Container(
                      width: 46.w,
                      height: 46.w,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 14.w,
                        height: 14.w,
                        child: Assets.svg.filterSolid.svg(
                          colorFilter: const ColorFilter.mode(
                            AppColors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 80.h,
          child: Container(
            // color: AppColors.white,
            margin: EdgeInsets.only(
              left: 32.w,
              right: 32.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      width: 46.w,
                      height: 46.w,
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
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 14.w,
                        height: 14.w,
                        child: Assets.svg.walletSolid.svg(),
                      ),
                    ),
                    8.verticalSpace,
                    Container(
                      width: 46.w,
                      height: 46.w,
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
                  ],
                ),
                Container(
                  width: 150.w,
                  height: 46.h,
                  padding: EdgeInsets.only(left: 16.w, right: 8.w),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(46.h),
                    // boxShadow: AppBoxShadow.primaryBoxShadow,
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
                    children: [
                      Container(
                        width: 15.w,
                        height: 15.w,
                        margin: EdgeInsets.only(right: 8.w),
                        child: Assets.svg.listSolid.svg(),
                      ),
                      const Expanded(
                        child: Text(
                          'List of variants',
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
