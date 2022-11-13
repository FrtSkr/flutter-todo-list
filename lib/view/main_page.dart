import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/double_values.dart';
import 'package:todo_list/model/user_model.dart';
import 'package:todo_list/view/profile/profile_page.dart';

import '../core/components/custom_tab_bar.dart';
import '../padding_values.dart';
import '../project_colors.dart';
import 'home/home_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key, required this.user});
  UserModel? user;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with CustomColors, TickerProviderStateMixin, PaddingValues {
  late final TabController _tabController;
  late final List<Widget> _tabs;

  @override
  void initState() {
    _tabController = TabController(length: _BottomNavItems.values.length, vsync: this);
    _tabs = [
      Tab(text: _BottomNavItems.Home.name, icon: const Icon(Icons.home_outlined), iconMargin: PD_B_5),
      Tab(text: _BottomNavItems.Profile.name, icon: const Icon(Icons.person_outline), iconMargin: PD_B_5),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          notchMargin: DoubleValues.notchValue,
          shape: const CircularNotchedRectangle(),
          child: CustomTabBar(
            tabController: _tabController,
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            HomePage(
              user: widget.user,
            ),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}

enum _BottomNavItems { Home, Profile }
