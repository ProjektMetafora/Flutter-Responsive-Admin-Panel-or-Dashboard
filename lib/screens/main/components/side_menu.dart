import 'package:admin/providers/providers.dart';
import 'package:admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SideMenu extends HookWidget {
  final PageController pageController;

  const SideMenu(this.pageController, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPage = useProvider(currentPageProvider);

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
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                currentPage.state = '/';
                pageController.animateToPage(routeToIndex('/'), duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                Navigator.of(context).pop();
              },
            ),
            DrawerListTile(
              title: "Transaction",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {
                // context.beamToNamed('/transactions');
                currentPage.state = '/transactions';
                pageController.animateToPage(routeToIndex('/transactions'), duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                Navigator.of(context).pop();
              },
            ),
            DrawerListTile(
              title: "Task",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {
                // context.beamToNamed('/tasks');
                currentPage.state = '/tasks';
                pageController.animateToPage(routeToIndex('/tasks'), duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                Navigator.of(context).pop();
              },
            ),
            DrawerListTile(
              title: "Documents",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Store",
              svgSrc: "assets/icons/menu_store.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Notification",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Profile",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {},
            ),
            DrawerListTile(
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
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

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
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
