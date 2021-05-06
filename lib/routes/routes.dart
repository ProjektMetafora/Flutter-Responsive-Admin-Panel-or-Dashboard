import 'package:admin/screens/tasks/tasks_screen.dart';
import 'package:admin/screens/transactions/transactions_screen.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/dashboard/dashboard_screen.dart';
import '../screens/main/main_screen.dart';

class DashboardLocation extends BeamLocation {
  DashboardLocation(BeamState state) : super(state);

  @override
  List<BeamPage> pagesBuilder(BuildContext context, BeamState state) => [
        BeamPage(
          type: BeamPageType.fadeTransition,
          key: ValueKey('dashboardView'),
          child: DashboardScreen(),
        ),
      ];

  @override
  List<String> get pathBlueprints => ['/dashboard'];
}

class TasksLocation extends BeamLocation {
  TasksLocation(BeamState state) : super(state);

  @override
  List<BeamPage> pagesBuilder(BuildContext context, BeamState state) => [
        BeamPage(
          type: BeamPageType.fadeTransition,
          key: ValueKey('tasksView'),
          child: TasksScreen(),
        ),
      ];

  @override
  List<String> get pathBlueprints => ['/tasks'];
}

class TransactionsLocation extends BeamLocation {
  TransactionsLocation(BeamState state) : super(state);

  @override
  List<BeamPage> pagesBuilder(BuildContext context, BeamState state) => [
        BeamPage(
          type: BeamPageType.fadeTransition,
          key: ValueKey('transactionsView'),
          child: TransactionsScreen(),
        ),
      ];

  @override
  List<String> get pathBlueprints => ['/transactions'];
}
