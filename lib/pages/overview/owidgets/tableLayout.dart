import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<dynamic> courseList = [];

final courseListUrl =
    'http://localhost/platoapi/Department/StudentCourseapi.php';

String cid = "CSE303";

class dataTableView extends StatefulWidget {
  @override
  _dataTableViewState createState() => _dataTableViewState();
}

class _dataTableViewState extends State<dataTableView> {
  static const _GET_ALL_ACTION = 'GET ALL';

  void getCrsList() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response =
          await http.post(Uri.parse(courseListUrl), body: map, headers: {
        //'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Headers": "*"
      });
      print('getCoursesList Response: ${response.body}');
      if (200 == response.statusCode) {
        var parsed = jsonDecode(response.body) as List;
        setState(() {
          courseList = parsed.map<String>((e) => e['CourseID']).toList();
          print(courseList);

          print(response.body);
        });
      } else {
        //data = response.statusCode as String;
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getCrsList();
  }

  Object? get showBorders => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
          border: Border.all(color: lightGrey, width: .5)),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CustomText(
                  text: "PLO Table",
                  size: 24,
                  color: Colors.grey,
                  weight: FontWeight.bold),
            ],
          ),
          DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            border: getCurrentRouteOption(context) == showBorders
                ? TableBorder(
                    top: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.grey[300]!),
                    left: BorderSide(color: Colors.grey[300]!),
                    right: BorderSide(color: Colors.grey[300]!),
                    verticalInside: BorderSide(color: Colors.grey[300]!),
                    horizontalInside: BorderSide(color: Colors.grey, width: 1))
                : null,
            columns: [
              DataColumn(
                label: Text('Course ID'),
              ),
              DataColumn(
                label: Text('PLO1'),
              ),
              DataColumn(
                label: Text('PLO2'),
              ),
            ],
            rows: courseList
                .map(
                  (coursel) => DataRow(cells: [
                    DataCell(
                      Text(coursel.clist),
                    ),
                  ]),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  getCurrentRouteOption(BuildContext context) {}
}
