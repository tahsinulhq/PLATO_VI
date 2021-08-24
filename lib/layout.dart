
import 'package:flutter/material.dart';
import 'widgets/large_screen.dart';
import 'widgets/small_screen.dart';
import 'helpers/responsiveness.dart';
import 'widgets/top_nav.dart';
import 'widgets/side_menu.dart';


class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(child: SideMenu(),),
        extendBodyBehindAppBar: true,
        appBar: topNavigationBar(context, scaffoldKey),
        body: ResponsiveWidget(largeScreen: LargeScreen(), smallScreen: SmallScreen(),
          mediumScreen: LargeScreen(),)
    );
  }
}