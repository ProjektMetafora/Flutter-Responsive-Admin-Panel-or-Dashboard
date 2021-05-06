import 'package:admin/controllers/MenuController.dart';
import 'package:admin/providers/menu_provider.dart';
import 'package:admin/providers/providers.dart';
import 'package:admin/responsive.dart';
import 'package:admin/routes/routes.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/tasks/tasks_screen.dart';
import 'package:admin/screens/transactions/transactions_screen.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard/dashboard_screen.dart';
import '../dashboard/dashboard_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulHookWidget {
  final GlobalKey<BeamerState> beamerKey;

  MainScreen({this.beamerKey});

  @override
  _MainScreenState createState() => _MainScreenState();
}

final _beamLocations = [
  DashboardLocation(BeamState.fromUri(Uri.parse('/dashboard'))),
  TransactionsLocation(BeamState.fromUri(Uri.parse('/transactions'))),
  TasksLocation(BeamState.fromUri(Uri.parse('/tasks'))),
];

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final menuChange = useProvider(menuChangeProvider);
    final _beamerRouterDelegate = BeamerRouterDelegate(
      locationBuilder: BeamerLocationBuilder(
        beamLocations: _beamLocations,
      ),
    );

    return Scaffold(
      key: menuChange.scaffoldKey,
      drawer: SideMenu(
        beamerKey: widget.beamerKey,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(
                  beamerKey: widget.beamerKey,
                ),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Beamer(
                key: widget.beamerKey,
                routerDelegate: _beamerRouterDelegate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
