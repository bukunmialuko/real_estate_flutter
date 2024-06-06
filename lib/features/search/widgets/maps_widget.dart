import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:superapp/core/styling/app_colors.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({super.key});

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  Widget _darkModeTileBuilder(
    BuildContext context,
    Widget tileWidget,
    TileImage tile,
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
    );
  }
}
