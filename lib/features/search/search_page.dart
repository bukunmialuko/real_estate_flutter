import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp/features/search/enum/menu_enum.dart';
import 'package:superapp/features/search/widgets/list_of_variants_widget.dart';
import 'package:superapp/features/search/widgets/maps_widget.dart';
import 'package:superapp/features/search/widgets/menu_widget.dart';
import 'package:superapp/features/search/widgets/search_filter_widget.dart';
import 'package:superapp/features/search/widgets/search_widget.dart';
import 'package:superapp/features/search/widgets/send_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  MenuEnum selectedMenuEnum = MenuEnum.price;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
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
        MapsWidget(selectedMenuEnum: selectedMenuEnum),
        // Note: Its common for search to be done in another UI
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
                  8.horizontalSpace,
                  SearchFilterWidget(scale: _animation),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.only(
                left: 32.w,
                right: 32.w,
                bottom: 8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MenuWidget(
                    selectedMenuEnum: selectedMenuEnum,
                    onTapMenu: (MenuEnum menuEnum) {
                      setState(() {
                        selectedMenuEnum = menuEnum;
                      });
                    },
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
        ),
      ],
    );
  }
}
