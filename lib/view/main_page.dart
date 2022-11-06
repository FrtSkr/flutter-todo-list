import 'package:flutter/material.dart';

import '../padding_values.dart';
import '../project_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with CustomColors, TickerProviderStateMixin, PaddingValues {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _BottomNavItems.values.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _BottomNavItems.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          backgroundColor: lightSeaGreen,
          foregroundColor: white,
          child: const Icon(Icons.add_outlined),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: MainPageDoubleValues.notchValue,
          shape: const CircularNotchedRectangle(),
          child: CustomTabBar(
            indicatorColor: white,
            labelColor: lightSeaGreen,
            unselectedLabelColor: dimGray,
            tabController: _tabController,
            iconMargin: PD_B_5,
          ),
        ),
        body: TabBarView(controller: _tabController, children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.white,
          ),
        ]),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required this.indicatorColor,
    required this.labelColor,
    required this.unselectedLabelColor,
    required TabController tabController,
    required this.iconMargin,
  })  : _tabController = tabController,
        super(key: key);

  final Color indicatorColor;
  final Color labelColor;
  final Color unselectedLabelColor;
  final TabController _tabController;
  final EdgeInsets iconMargin;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: indicatorColor,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
      labelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontSize: MainPageDoubleValues.selectedFontSize,
          ),
      unselectedLabelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontSize: MainPageDoubleValues.unselectedFontSize,
          ),
      controller: _tabController,
      tabs: [
        _TabItems(_BottomNavItems.Home.name, const Icon(Icons.home_outlined)),
        _TabItems(_BottomNavItems.Profile.name, const Icon(Icons.person_outline)),
      ],
    );
  }

  Tab _TabItems(String? text, Widget? icon) {
    return Tab(
      iconMargin: iconMargin,
      text: text,
      icon: icon,
    );
  }
}

enum _BottomNavItems { Home, Profile }

class MainPageDoubleValues {
  static double selectedFontSize = 15.0;
  static double unselectedFontSize = 12.0;
  static double notchValue = 10.0;
}
