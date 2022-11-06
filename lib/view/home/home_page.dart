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
          backgroundColor: CustomColors().lightSeaGreen,
          foregroundColor: CustomColors().white,
          child: const Icon(Icons.add_outlined),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: HomePageDoubleValues.notchValue,
          shape: const CircularNotchedRectangle(),
          child: TabBar(
            indicatorColor: CustomColors().white,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: CustomColors().lightSeaGreen,
            unselectedLabelColor: CustomColors().dimGray,
            labelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: HomePageDoubleValues.selectedFontSize,
                ),
            unselectedLabelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: HomePageDoubleValues.unselectedFontSize,
                ),
            controller: _tabController,
            tabs: [
              Tab(
                iconMargin: PaddingValues().PD_B_5,
                text: _BottomNavItems.Home.name,
                icon: const Icon(Icons.home_outlined),
              ),
              Tab(
                iconMargin: PaddingValues().PD_B_5,
                text: _BottomNavItems.Profile.name,
                icon: const Icon(Icons.person_outline),
              )
            ],
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

enum _BottomNavItems { Home, Profile }

class HomePageDoubleValues {
  static double selectedFontSize = 15.0;
  static double unselectedFontSize = 12.0;
  static double notchValue = 10.0;
}
