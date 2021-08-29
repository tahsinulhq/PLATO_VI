const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const OverViewPageRoute = "/Overview";

const InstructorPageDisplayName = "Instructor";
const InstructorPageRoute = "/Instructor";

const StudentPageDisplayName = "Student";
const StudentPageRoute = "/Student";

const DepartmentPageDisplayName = "Department";
const DepartmentPageRoute = "/Department";

const HigherAuthorityPageDisplayName = "Higher Authority";
const HigherAuthorityPageRoute = "/Higher Authority";

const AuthenticationPageDisplayName = "Log Out";
const AuthenticationPageRoute = "/Log Out";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, OverViewPageRoute),
  MenuItem(InstructorPageDisplayName, InstructorPageRoute),
  MenuItem(StudentPageDisplayName, StudentPageRoute),
  MenuItem(DepartmentPageDisplayName, DepartmentPageRoute),
  MenuItem(HigherAuthorityPageDisplayName, HigherAuthorityPageRoute),
  MenuItem(AuthenticationPageDisplayName, AuthenticationPageRoute)
];

// List sideMenuItems = [
//   OverViewPageRoute,
//   FormsPageRoute,
//   ReportsPageRoute,
//   GradePageRoute,
//   AuthenticationPageRoute
// ];