import 'package:plato_six/pages/instructor/cotoexam.dart';
import 'package:plato_six/pages/instructor/evaluationMap.dart';
import 'package:plato_six/pages/instructor/plotocomap.dart';
import 'package:plato_six/pages/overview/overview.dart';

import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      padding: EdgeInsets.fromLTRB(20.0, 5.0, 15.0, 5.0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 60.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!,',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Quando',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'raleway',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    //backgroundImage: AssetImage('img/user-icon.jpg'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.height * .10,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 8,
                  child: InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'logo.png',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Menu',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quando',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              flex: 4,
              child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(0.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  shrinkWrap: true,
                  children: [
                    chooseMenu(
                      context,
                      "CO to PLO Mapping",
                      'map.png',
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => plotocoPage()));
                      },
                    ),
                    chooseMenu(
                      context,
                      "CO to Exam Mapping",
                      'map.png',
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => cotoExamPage()));
                      },
                    ),
                    // chooseMenu(
                    // context,
                    // "Manage Student",
                    // 'img/user-icon.jpg',
                    // () {
                    //      Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => GetStudentList()));
                    // },
                    // ),

                    // chooseMenu(
                    // context,
                    // "Announcement",
                    // 'img/announcement.png',
                    // () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ManageAnnouncement()));
                    // },
                    // ),
                    //  chooseMenu(
                    // context,
                    // "Account",
                    // 'img/test.png',
                    // () {
                    //     Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => AdminProfile()));
                    // },
                    // ),
                    chooseMenu(
                      context,
                      "Evaluation Input",
                      'map.png',
                      () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => evaluationMapPage()),
                            (Route<dynamic> route) => false);
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminBottomNav extends StatefulWidget {
  @override
  _AdminBottomNavState createState() => _AdminBottomNavState();
}

class _AdminBottomNavState extends State<AdminBottomNav> {
  int _selectedIndex = 0;
  final menu = [
    new AdminDashboard(),
    // new About(),
    // new AdminProfile(),
  ];
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 15.0,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              size: 15.0,
            ),
            title: Text(
              'About',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.verified_user_sharp,
              size: 15.0,
            ),
            title: Text(
              'Account',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        ],
        //fixedColor: Colors.blueAccent,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        elevation: 5,
        backgroundColor: Colors.white,
      ),
    );
  }
}

Widget chooseMenu(context, String text, String icon, var route) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Card(
      child: InkWell(
        highlightColor: Colors.cyan,
        onTap: route,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 30,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 10.0,
                fontFamily: 'Quando',
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    ),
  );
}
