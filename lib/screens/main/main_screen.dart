import 'package:admin/controllers/MenuController.dart';
import 'package:admin/providers/menu_provider.dart';
import 'package:admin/providers/providers.dart';
import 'package:admin/responsive.dart';
import 'package:admin/routes/routes.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/tasks/tasks_screen.dart';
import 'package:admin/screens/transactions/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard/dashboard_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final menuChange = useProvider(menuChangeProvider);
    final currentPage = useProvider(currentPageProvider);
    final pageController = usePageController();

    return Scaffold(
      // key: context.read<MenuController>().scaffoldKey,
      key: menuChange.scaffoldKey,
      drawer: SideMenu(pageController),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(pageController),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: PageView(
                onPageChanged: (index) => currentPage.state = indexToRoute(index),
                controller: pageController,
                children: [
                  DashboardScreen(),
                  TransactionsScreen(),
                  TasksScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
