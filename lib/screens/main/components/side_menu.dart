import 'package:admin/providers/menu_provider.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SideMenu extends StatefulHookWidget {
  final GlobalKey<BeamerState> beamerKey;

  const SideMenu({Key key, this.beamerKey}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

enum DrawerSelection {
  dashboard,
  transactions,
  tasks
}

final drawerSelectionProvider = StateProvider((ref) => DrawerSelection.dashboard);

class _SideMenuState extends State<SideMenu> {

  /// drawer selection, default is dashboard
  DrawerSelection drawerSelection = DrawerSelection.dashboard;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = useProvider(menuChangeProvider);
    final _drawerSelection = useProvider(drawerSelectionProvider);

    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            DrawerListTile(
              title: "Dashboard",
              selected: _drawerSelection.state == DrawerSelection.dashboard,
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                _drawerSelection.state = DrawerSelection.dashboard;
                widget.beamerKey.currentState.routerDelegate
                    .beamToNamed('/dashboard');
                menuProvider.closeMenu();
              },
            ),
            DrawerListTile(
              selected: _drawerSelection.state == DrawerSelection.transactions,
              title: "Transaction",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {
                _drawerSelection.state = DrawerSelection.transactions;
                widget.beamerKey.currentState.routerDelegate
                    .beamToNamed('/transactions');
                menuProvider.closeMenu();
              },
            ),
            DrawerListTile(
              selected: _drawerSelection.state == DrawerSelection.tasks,
              title: "Task",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {
                _drawerSelection.state = DrawerSelection.tasks;
                widget.beamerKey.currentState.routerDelegate
                    .beamToNamed('/tasks');
                menuProvider.closeMenu();
              },
            ),
            DrawerListTile(
              selected: false,
              title: "Documents",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {},
            ),
            DrawerListTile(
              selected: false,
              title: "Store",
              svgSrc: "assets/icons/menu_store.svg",
              press: () {},
            ),
            DrawerListTile(
              selected: false,
              title: "Notification",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () {},
            ),
            DrawerListTile(
              selected: false,
              title: "Profile",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {},
            ),
            DrawerListTile(
              selected: false,
              title: "Settings",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    @required this.title,
    @required this.svgSrc,
    @required this.press,
    @required this.selected
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54, fontWeight: selected ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
