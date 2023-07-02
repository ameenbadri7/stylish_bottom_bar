import 'package:flutter/material.dart' hide Badge;;
import 'package:stylish_bottom_bar/src/badge/badge.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

enum BadgeAnimationType {
  slide,
  fade,
  scale,
}

enum BadgeShape { circle, square }

class IconWidget extends StatelessWidget {
  const IconWidget({
    Key? key,
    required this.animation,
    required this.iconSize,
    required this.selected,
    required this.item,
    required this.unselectedIconColor,
  }) : super(key: key);

  final Animation<double> animation;
  final double iconSize;
  final bool selected;
  final Color? unselectedIconColor;
  final BubbleBarItem item;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      heightFactor: 1.0,
      child: Badge(
        showBadge: item.showBadge,
        badgeContent: item.badge,
        badgeColor: item.badgeColor,
        animationType: BadgeAnimationType.fade,
        borderRadius: item.badgeRadius,
        child: IconTheme(
          data: IconThemeData(
            color: selected ? item.backgroundColor : unselectedIconColor,
            size: iconSize,
          ),
          child: selected
              ? item.activeIcon != null
                  ? item.activeIcon!
                  : item.icon
              : item.icon,
        ),
      ),
    );
  }
}
