import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp/generated/assets.gen.dart';

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

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    required this.model,
    super.key,
  });

  final TileModel model;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            height: 42.h,
            width: expand ? screenWidth : 42.h,
            duration: const Duration(milliseconds: 2000),
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
                ).animate().fadeIn(delay: const Duration(milliseconds: 4000)),
                Row(
                  mainAxisAlignment: expand
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    Align(
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
              ],
            ),
          ).animate(onComplete: (s) {
            setState(() {
              expand = true;
            });
          }).scale(delay: const Duration(milliseconds: 2000)),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
