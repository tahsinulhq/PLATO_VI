
const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const OverViewPageRoute = "/Overview";

const FormPageDisplayName = "Forms";
const FormsPageRoute = "/Forms";

const ReportsPageDisplayName = "Reports";
const ReportsPageRoute = "/Reports";

const GradePageDisplayName = "Grade";
const GradePageRoute = "/Grade";

const AuthenticationPageDisplayName = "Authentication";
const AuthenticationPageRoute = "/Authentication";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, OverViewPageRoute),
  MenuItem(FormPageDisplayName, FormsPageRoute),
  MenuItem(ReportsPageDisplayName, ReportsPageRoute),
  MenuItem(GradePageDisplayName, GradePageRoute),
  MenuItem(AuthenticationPageDisplayName, AuthenticationPageRoute)
];

// List sideMenuItems = [
//   OverViewPageRoute,
//   FormsPageRoute,
//   ReportsPageRoute,
//   GradePageRoute,
//   AuthenticationPageRoute
// ];