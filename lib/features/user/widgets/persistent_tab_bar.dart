import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/utils.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isDark = isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: isDark ? Colors.grey.shade800 : Colors.grey.shade100,
            width: 1,
          ),
        ),
      ),
      child: const TabBar(
        tabs: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: Tab(
              icon: FaIcon(FontAwesomeIcons.grip),
            ),
          ),
          Tab(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
              child: FaIcon(FontAwesomeIcons.heart),
            ),
          )
        ],
        // labelColor: Colors.black,
        // dividerColor: Colors.grey.shade100,
        // indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
