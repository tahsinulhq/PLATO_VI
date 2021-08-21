
import 'package:flutter/material.dart';
import 'widgets/large_screen.dart';
import 'widgets/small_screen.dart';
import 'helpers/responsiveness.dart';

class SiteLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0,
          backgroundColor: Colors.orange,
        ),
        body: ResponsiveWidget(largeScreen: LargeScreen(), smallScreen: SmallScreen(),
          mediumScreen: LargeScreen(),)
    );
  }
}