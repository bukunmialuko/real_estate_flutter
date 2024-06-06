import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/features/search/enum/menu_enum.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    required this.selectedMenuEnum,
    required this.onTapMenu,
    super.key,
  });

  final MenuEnum selectedMenuEnum;
  final void Function(MenuEnum) onTapMenu;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: Container(
            width: 46.h,
            height: 46.h,
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
            child: Icon(
              widget.selectedMenuEnum.icon,
              color: AppColors.white,
              size: 20,
            ),
          ),
        ),
        _MenuItems(
          selectedMenuEnum: widget.selectedMenuEnum,
          onTapMenu: widget.onTapMenu,
          scaleAnimation: _scaleAnimation,
          controller: _controller,
        ),
      ],
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({
    required this.scaleAnimation,
    required this.selectedMenuEnum,
    required this.onTapMenu,
    required this.controller,
  });

  final Animation<double> scaleAnimation;
  final AnimationController controller;
  final MenuEnum selectedMenuEnum;
  final void Function(MenuEnum) onTapMenu;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: ScaleTransition(
        scale: scaleAnimation,
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 8,
            bottom: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _MenuItem(
                menuEnum: MenuEnum.cosyArea,
                selectedMenuEnum: selectedMenuEnum,
                onTapMenu: (MenuEnum tappedMenuEnum) {
                  controller.reverse();
                  onTapMenu(tappedMenuEnum);
                },
              ),
              _MenuItem(
                menuEnum: MenuEnum.price,
                selectedMenuEnum: selectedMenuEnum,
                onTapMenu: (MenuEnum tappedMenuEnum) {
                  controller.reverse();
                  onTapMenu(tappedMenuEnum);
                },
              ),
              _MenuItem(
                menuEnum: MenuEnum.infrastructure,
                selectedMenuEnum: selectedMenuEnum,
                onTapMenu: (MenuEnum tappedMenuEnum) {
                  controller.reverse();
                  onTapMenu(tappedMenuEnum);
                },
              ),
              _MenuItem(
                menuEnum: MenuEnum.withoutAnyLayer,
                selectedMenuEnum: selectedMenuEnum,
                onTapMenu: (MenuEnum tappedMenuEnum) {
                  controller.reverse();
                  onTapMenu(tappedMenuEnum);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.menuEnum,
    required this.selectedMenuEnum,
    required this.onTapMenu,
  });

  final MenuEnum menuEnum;
  final MenuEnum selectedMenuEnum;
  final void Function(MenuEnum) onTapMenu;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapMenu(menuEnum);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              menuEnum.icon,
              color: menuEnum == selectedMenuEnum
                  ? AppColors.lightOrange
                  : AppColors.lightCarton,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              menuEnum.label,
              style: TextStyle(
                color: menuEnum == selectedMenuEnum
                    ? AppColors.lightOrange
                    : AppColors.lightCarton,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
