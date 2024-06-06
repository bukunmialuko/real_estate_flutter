import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/features/home/widgets/user_location_widget.dart';
import 'package:superapp/generated/assets.gen.dart';
import 'package:superapp/l10n/l10n.dart';

List<TileModel> imagePaths = [
  TileModel(imagePath: Assets.rooms.room1.path, label: ''),
  TileModel(imagePath: Assets.rooms.room2.path, label: ''),
  TileModel(imagePath: Assets.rooms.room3.path, label: ''),
  TileModel(imagePath: Assets.rooms.room4.path, label: ''),
  TileModel(imagePath: Assets.rooms.room5.path, label: ''),
  TileModel(imagePath: Assets.rooms.room6.path, label: ''),
  TileModel(imagePath: Assets.rooms.room7.path, label: ''),
];

class TileModel {
  TileModel({required this.imagePath, required this.label});

  final String imagePath;
  final String label;
}

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
      Future.delayed(const Duration(milliseconds: 3000), () {
        _draggableScrollableController.animateTo(
          0.68,
          duration: const Duration(seconds: 2),
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
        const GradientBackground(),
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
                      .scale(duration: const Duration(milliseconds: 1500)),
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
              ).animate().fadeIn(delay: const Duration(milliseconds: 2500)),
              8.verticalSpace,
              Text(
                context.l10n.letsSelect,
                style: TextStyle(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  height: 0,
                ),
                textAlign: TextAlign.left,
              ),
              32.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160.w,
                    height: 160.w,
                    decoration: const BoxDecoration(
                      color: AppColors.darkOrange,
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
                        Text(
                          '1 034',
                          style: TextStyle(
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                            height: 0,
                          ),
                          textAlign: TextAlign.center,
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
                  ),
                  Container(
                    width: 160.w,
                    height: 160.w,
                    decoration: BoxDecoration(
                      color: const Color(0xfffffdfb),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        12.verticalSpace,
                        Text(
                          context.l10n.rent,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGrey,
                            height: 0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        28.verticalSpace,
                        Text(
                          '2 212',
                          style: TextStyle(
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightGrey,
                            height: 0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        2.verticalSpace,
                        Text(
                          context.l10n.offers,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGrey,
                            height: 0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        DraggableScrollableSheet(
          maxChildSize: 0.8,
          initialChildSize: 0.44,
          minChildSize: 0.2,
          controller: _draggableScrollableController,
          builder: (context, scrollableController) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
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
                    (context, index) => Tile(
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

class Tile extends StatefulWidget {
  const Tile({
    required this.model,
    super.key,
  });

  final TileModel model;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18.w, right: 18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: Image.asset(widget.model.imagePath).image,
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 40.h,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(56.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Gladkova., 25',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 38.h,
                    width: 38.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      size: 18,
                      Icons.chevron_right_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          // Container(
          //   height: 40.h,
          //   width: double.infinity,
          //   margin: EdgeInsets.only(bottom: 10.h, left: 18.w, right: 18.w),
          //   decoration: BoxDecoration(
          //     color: Colors.white.withOpacity(0.8),
          //     borderRadius: BorderRadius.circular(56.r),
          //   ),
          //   child: Stack(
          //     children: [
          //       const Center(
          //         child: Text('Gladkova., 25'),
          //       ),
          //       Container(
          //         height: 40.h,
          //         width: double.infinity,
          //         margin:
          //             EdgeInsets.only(bottom: 10.h, left: 18.w, right: 18.w),
          //         decoration: BoxDecoration(
          //           color: Colors.white.withOpacity(0.8),
          //           borderRadius: BorderRadius.circular(56.r),
          //         ),
          //         child: const Icon(
          //           Icons.chevron_right_rounded,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.centerRight,
          radius: 1.3,
          colors: [
            Color(0xFFf9e1c4), Color(0xFFFFFFFF), // White color
          ],
        ),
      ),
    );
  }
}
