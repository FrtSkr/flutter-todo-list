import 'package:flutter/material.dart';
import 'package:todo_list/core/components/custom_tab_bar.dart';
import 'package:todo_list/padding_values.dart';
import 'package:todo_list/project_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin, PaddingValues, CustomColors {
  late final TabController _tabController;
  final List<Widget> _tabs = [
    Tab(text: _tabBarItems.To_Do.name.replaceAll('_', ' ')),
    Tab(text: _tabBarItems.In_Progress.name.replaceAll('_', ' ')),
    Tab(text: _tabBarItems.Done.name),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _tabBarItems.values.length, vsync: this);
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
      length: _tabBarItems.values.length,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          actions: [
            Padding(
              padding: PD_R_10,
              child: InkWell(onTap: () {}, child: const Icon(Icons.density_medium_outlined)),
            ),
          ],
          bottom: CustomTabBar(tabController: _tabController, tabs: _tabs),
        ),
      ),
    );
  }
}

enum _tabBarItems { To_Do, In_Progress, Done }
