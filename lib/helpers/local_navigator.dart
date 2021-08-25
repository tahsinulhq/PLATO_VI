import 'package:flutter/cupertino.dart';
import 'package:plato_six/constant/controllers.dart';
import 'package:plato_six/routing/router.dart';
import 'package:plato_six/routing/routes.dart';

Navigator localNavigator() => Navigator(
  key: navigationController.navigatorKey,
  initialRoute: OverViewPageRoute,
  onGenerateRoute: generateRoute,
);