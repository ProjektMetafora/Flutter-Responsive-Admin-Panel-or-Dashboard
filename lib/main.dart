import 'package:admin/constants.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/tasks/tasks_screen.dart';
import 'package:admin/screens/transactions/transactions_screen.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'screens/main/main_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {

  final _beamerRouterDelegate = BeamerRouterDelegate(
    initialPath: '/dashboard',
    locationBuilder: SimpleLocationBuilder(
      routes: {
        '/*': (context) => MainScreen(
          beamerKey: GlobalKey<BeamerState>(),
        ),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      routeInformationParser: BeamerRouteInformationParser(),
      routerDelegate: _beamerRouterDelegate,
    );
  }
}
