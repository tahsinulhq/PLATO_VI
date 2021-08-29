import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plato_six/pages/authentication/authentication.dart';
import 'package:plato_six/pages/department/department.dart';
import 'package:plato_six/pages/higherauthority/higherauthority.dart';
import 'package:plato_six/pages/instructor/instructor.dart';
import 'package:plato_six/pages/overview/overview.dart';
import 'package:plato_six/pages/student/student.dart';
import 'package:plato_six/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverViewPageRoute:
      return _getPageRoute(OverviewPage());
    case InstructorPageRoute:
      return _getPageRoute(InstructorPage());
    case StudentPageRoute:
      return _getPageRoute(StudentPage());
    case DepartmentPageRoute:
      return _getPageRoute(DepartmentPage());
    case HigherAuthorityPageRoute:
      return _getPageRoute(HigherAuthorityPage());
    case AuthenticationPageRoute:
      return _getPageRoute(AuthenticationPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
