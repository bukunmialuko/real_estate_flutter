import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/features/home/widgets/buy_widget.dart';
import 'package:superapp/features/home/widgets/custom_list_tile.dart';
import 'package:superapp/features/home/widgets/gradient_background_widget.dart';
import 'package:superapp/features/home/widgets/rent_widget.dart';
import 'package:superapp/features/home/widgets/user_location_widget.dart';
import 'package:superapp/generated/assets.gen.dart';
import 'package:superapp/l10n/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late DraggableScrollableController _draggableScrollableController;

  @override
  void initState() {
    super.initState();
    _draggableScrollableController = DraggableScrollableController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 3500), () {
        _draggableScrollableController.animateTo(
          0.68,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  void dispose() {
    _draggableScrollableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBackgroundWidget(),
        SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const UserLocationWidget(),
                  CircleAvatar(
                    backgroundImage: AssetImage(Assets.png.avatar.path),
                  )
                      .animate()
                      .scale(duration: const Duration(milliseconds: 900)),
                ],
              ),
              28.verticalSpace,
              Text(
                context.l10n.hiMarina,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff9f8d74),
                  height: 0,
                ),
                textAlign: TextAlign.left,
              ).animate().fadeIn(delay: const Duration(milliseconds: 1200)),
              8.verticalSpace,
              ShowUpAnimation(
                delayStart: const Duration(milliseconds: 1000),
                animationDuration: const Duration(milliseconds: 900),
                child: Text(
                  context.l10n.letsSelect,
                  style: TextStyle(
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                    height: 0,
                  ),
                ),
              ),
              32.verticalSpace,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BuyWidget(),
                  RentWidget(),
                ],
              ),
            ],
          ),
        ),
        DraggableScrollableSheet(
          maxChildSize: 0.8,
          initialChildSize: 0.3,
          minChildSize: 0.2,
          controller: _draggableScrollableController,
          builder: (context, scrollableController) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(28.r),
              child: ColoredBox(
                color: Colors.white,
                child: GridView.custom(
                  padding: EdgeInsets.only(
                    left: 8.w,
                    right: 8.w,
                    top: 8.h,
                  ),
                  controller: scrollableController,
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 6.h,
                    crossAxisSpacing: 6.w,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: const [
                      QuiltedGridTile(2, 4),
                      QuiltedGridTile(4, 2),
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(2, 2),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) => CustomListTile(
                      model: imagePaths[index],
                    ),
                    childCount: imagePaths.length,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
