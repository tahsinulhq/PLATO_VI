import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/controllers/navigation_controller.dart';
import 'controllers/menu_controller.dart';
import 'layout.dart';
import 'pages/overview/overview.dart';
import 'routing/routes.dart';
import 'package:plato_six/pages/authentication/authentication.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //initialRoute: OverViewPageRoute,
      getPages: [
        GetPage(name: rootRoute, page: () {
          return SiteLayout();
        }),
       // GetPage(name: OverViewPageRoute, page: () => OverviewPage()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Plato VI Dashboard',
      theme: ThemeData(
          scaffoldBackgroundColor: light,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply(bodyColor: Colors.black)),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          }),
          primaryColor: Colors.blue
      ),
      //home: SiteLayout(),
    );
}}
