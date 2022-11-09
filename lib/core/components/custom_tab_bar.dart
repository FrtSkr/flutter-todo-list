import 'package:flutter/material.dart';
import 'package:todo_list/project_colors.dart';
import 'dart:math' as math;
import '../constants/double_values.dart';

class CustomTabBar extends StatelessWidget with CustomColors implements PreferredSizeWidget {
  final double _kTabHeight = 46.0;
  final double _indicatorWeight = 2.0;
  CustomTabBar({
    Key? key,
    required TabController tabController,
    required this.tabs,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: white,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: lightSeaGreen,
      unselectedLabelColor: dimGray,
      labelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontSize: DoubleValues.selectedFontSize,
          ),
      unselectedLabelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontSize: DoubleValues.unselectedFontSize,
          ),
      controller: _tabController,
      tabs: tabs,
    );
  }

  @override
  Size get preferredSize {
    double maxHeight = _kTabHeight;
    for (final Widget item in tabs) {
      if (item is PreferredSizeWidget) {
        final double itemHeight = item.preferredSize.height;
        maxHeight = math.max(itemHeight, maxHeight);
      }
    }
    return Size.fromHeight(maxHeight + _indicatorWeight);
  }
}
