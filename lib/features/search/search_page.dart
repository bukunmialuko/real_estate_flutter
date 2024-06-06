import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/features/search/widgets/list_of_variants_widget.dart';
import 'package:superapp/features/search/widgets/maps_widget.dart';
import 'package:superapp/features/search/widgets/menu_widget.dart';
import 'package:superapp/features/search/widgets/search_filter_widget.dart';
import 'package:superapp/features/search/widgets/search_widget.dart';
import 'package:superapp/features/search/widgets/send_widget.dart';
import 'package:superapp/generated/assets.gen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MapsWidget(),

        /// Note: Its common for search to be done in another UI

        Align(
          alignment: Alignment.topCenter,
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
                  Expanded(child: SearchWidget(scale: _animation)),
                  SizedBox(width: 8.w),
                  SearchFilterWidget(scale: _animation),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 80.h + (Platform.isAndroid ? 20.h : 20.h),
          child: Container(
            // color: AppColors.white,
            margin: EdgeInsets.only(
              left: 32.w,
              right: 32.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
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
                    const MenuWidget(),
                  ],
                ),
                8.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SendWidget(scale: _animation),
                    ListOfVariantsWidget(scale: _animation),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
