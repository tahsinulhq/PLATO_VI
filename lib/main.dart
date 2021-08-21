import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {git push <remote> <branch>
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plato VI Dashboard',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply(bodyColor: Colors.black)),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          }),
          primaryColor: Colors.blue
      ),
      home: SiteLayout(),
    );
}}
