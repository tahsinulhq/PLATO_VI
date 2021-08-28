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



// import 'package:flutter/material.dart';
// import 'package:plato_six/mysql/mysql.dart';
//
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter and Mysql Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   var db = new Mysql();
//   var mail = '';
//
//   void _getCustomer() {
//     db.getConnection().then((conn) {
//       String sql = 'select mail from company.customer where id = 10;';
//       conn.query(sql).then((results) {
//         for(var row in results){
//           setState(() {
//             mail = row[0];
//           });
//         }
//       });
//       conn.close();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'mail:',
//             ),
//             Text(
//               '$mail',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _getCustomer,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }