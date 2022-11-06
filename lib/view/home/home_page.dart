import 'package:flutter/material.dart';
import 'package:todo_list/padding_values.dart';
import 'package:todo_list/project_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with CustomColors, TickerProviderStateMixin, PaddingValues {
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
          notchMargin: HomePageDoubleValues.notchValue,
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
            fontSize: HomePageDoubleValues.selectedFontSize,
          ),
      unselectedLabelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontSize: HomePageDoubleValues.unselectedFontSize,
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

class HomePageDoubleValues {
  static double selectedFontSize = 15.0;
  static double unselectedFontSize = 12.0;
  static double notchValue = 10.0;
}
