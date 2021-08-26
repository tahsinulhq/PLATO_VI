import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plato_six/pages/forms/forms.dart';
import 'package:plato_six/pages/grade/grade.dart';
import 'package:plato_six/pages/overview/overview.dart';
import 'package:plato_six/pages/reports/reports.dart';
import 'package:plato_six/pages/authentication/authentication.dart';
import 'package:plato_six/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case OverViewPageRoute:
        return _getPageRoute(OverviewPage());
      case FormsPageRoute:
        return _getPageRoute(FormsPage());
      case ReportsPageRoute:
        return _getPageRoute(ReportsPage());
      case GradePageRoute:
        return _getPageRoute(GradePage());
      case AuthenticationPageRoute:
        return _getPageRoute(AuthenticationPage());
      default:
        return _getPageRoute(OverviewPage());
    }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}