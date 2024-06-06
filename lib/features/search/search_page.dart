import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/features/search/widgets/list_of_variants_widget.dart';
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

  Widget _darkModeTileBuilder(
    BuildContext context,
    Widget tileWidget,
    TileImage tile,
  ) {
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        -0.2126, -0.7152, -0.0722, 0, 255, // Red channel
        -0.2126, -0.7152, -0.0722, 0, 255, // Green channel
        -0.2126, -0.7152, -0.0722, 0, 255, // Blue channel
        0, 0, 0, 1, 0, // Alpha channel
      ]),
      child: tileWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: () {
            debugPrint('tappable');
          },
          child: FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(59.884772, 30.438456),
              initialZoom: 12,
              onMapReady: () {
                debugPrint('Map Ready');
              },
              onMapEvent: (e) {
                debugPrint('Map event:$e');
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                tileProvider: CancellableNetworkTileProvider(),
                tileBuilder: _darkModeTileBuilder,
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 40.w,
                    height: 40.h,
                    point: const LatLng(59.886, 30.408),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.darkOrange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                  Marker(
                    width: 40.w,
                    height: 40.h,
                    point: const LatLng(59.873, 30.47),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.darkOrange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                  Marker(
                    width: 40.w,
                    height: 40.h,
                    point: const LatLng(59.891, 30.47),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightOrange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                  Marker(
                    width: 40.w,
                    height: 40.h,
                    point: const LatLng(59.912, 30.473),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightOrange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                  Marker(
                    width: 40.w,
                    height: 40.h,
                    point: const LatLng(59.915, 30.418),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightOrange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                  Marker(
                    width: 40.w,
                    height: 40.h,
                    point: const LatLng(59.924, 30.412),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightOrange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

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
          bottom: 80.h,
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
