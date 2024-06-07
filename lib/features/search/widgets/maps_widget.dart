import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/features/search/enum/menu_enum.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({required this.selectedMenuEnum, super.key});

  final MenuEnum selectedMenuEnum;

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 600), () {
        _controller.forward(); // Start the animation
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _darkModeTileBuilder(
    BuildContext _,
    Widget tileWidget,
    TileImage __,
  ) {
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(
        <double>[
          -0.2126, -0.7152, -0.0722, 0, 255, // Red channel
          -0.2126, -0.7152, -0.0722, 0, 255, // Green channel
          -0.2126, -0.7152, -0.0722, 0, 255, // Blue channel
          0, 0, 0, 1, 0, // Alpha channel
        ],
      ),
      child: tileWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('tappable');
      },
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(59.884772, 30.438456),
          initialZoom: 12,
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
                width: 80.w,
                height: 40.h,
                point: const LatLng(59.880, 30.408),
                child: _AnimatedMarker(
                  scaleAnimation: _scaleAnimation,
                  selectedMenuEnum: widget.selectedMenuEnum,
                  price: '13,3 mn P',
                ),
              ),
              Marker(
                width: 80.w,
                height: 40.h,
                point: const LatLng(59.868, 30.47),
                child: _AnimatedMarker(
                  scaleAnimation: _scaleAnimation,
                  selectedMenuEnum: widget.selectedMenuEnum,
                  price: '6,95 mn P',
                ),
              ),
              Marker(
                width: 80.w,
                height: 40.h,
                point: const LatLng(59.8838, 30.47),
                child: _AnimatedMarker(
                  scaleAnimation: _scaleAnimation,
                  selectedMenuEnum: widget.selectedMenuEnum,
                  price: '8,5 mn P',
                ),
              ),
              Marker(
                width: 80.w,
                height: 40.h,
                point: const LatLng(59.904, 30.471),
                child: _AnimatedMarker(
                  scaleAnimation: _scaleAnimation,
                  selectedMenuEnum: widget.selectedMenuEnum,
                  price: '7,8 mn P',
                ),
              ),
              Marker(
                width: 80.w,
                height: 40.h,
                point: const LatLng(59.9075, 30.423),
                child: _AnimatedMarker(
                  scaleAnimation: _scaleAnimation,
                  selectedMenuEnum: widget.selectedMenuEnum,
                  price: '11 mn P',
                ),
              ),
              Marker(
                width: 80.w,
                height: 40.h,
                point: const LatLng(59.916, 30.414),
                child: _AnimatedMarker(
                  scaleAnimation: _scaleAnimation,
                  selectedMenuEnum: widget.selectedMenuEnum,
                  price: '10,3 mn P',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnimatedMarker extends StatelessWidget {
  const _AnimatedMarker({
    required this.scaleAnimation,
    required this.selectedMenuEnum,
    required this.price,
  });

  final Animation<double> scaleAnimation;
  final MenuEnum selectedMenuEnum;
  final String price;
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      alignment: Alignment.bottomLeft,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          width: selectedMenuEnum == MenuEnum.price ? 80.w : 40.h,
          duration: const Duration(milliseconds: 700),
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.darkOrange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            ),
          ),
          alignment: Alignment.center,
          child: selectedMenuEnum == MenuEnum.price
              ? Text(
                  price,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 13.sp,
                  ),
                ).animate().fadeIn(
                    delay: const Duration(milliseconds: 1100),
                    duration: const Duration(milliseconds: 500),
                  )
              : const Icon(
                  Icons.location_city_outlined,
                  color: AppColors.white,
                  size: 20,
                ).animate().fadeIn(
                    delay: const Duration(milliseconds: 1000),
                    duration: const Duration(milliseconds: 500),
                  ),
        ),
      ),
    );
  }
}
