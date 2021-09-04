import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/pages/department/dwidgets/chart%202.dart';
import 'chart.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


List<dynamic> studentPrPlolist = [];
List<dynamic> studentPrPloPerlist = [];

List<dynamic> PrPlolist = [];
List<dynamic> PrPloPerlist = [];

List<dynamic> achievedPlolist = [];
List<dynamic> achievedPloPerlist = [];

List<dynamic> failedPlolist = [];
List<dynamic> failedPloPerlist = [];


final studentPloUrl = 'http://localhost/platoapi/Department/StPLOProgramapi.php';
final coursePloUrl = 'http://localhost/platoapi/Department/AvgPLOProgramapi.php';

final achievedPloUrl = 'http://localhost/platoapi/Department/AchievedPLOCourseapi.php';
final failedPloUrl = 'http://localhost/platoapi/Department/FailedPLOCourseapi.php';

String pid = "BSc.CSE";
String stid = "1821557";

String cid = "CSE303";
String semester = "Summer";
String year = "2021";


class DeptSectionLarge extends StatefulWidget {
  @override
  State<DeptSectionLarge> createState() => _DeptSectionLargeState();
}

class _DeptSectionLargeState extends State<DeptSectionLarge> {

  void getStudentPrPloData() async {
    try{
      dynamic body = {
        "pid": "$pid",
        "stid": "$stid",
      };


      final response = await http.post(Uri.parse(studentPloUrl), body:
      json.encode(body),
          headers: {
            //'Content-Type': 'application/json; charset=UTF-8',
            "Access-Control-Allow-Origin": "*",
            'Content-type': 'application/json',
            'Accept': 'application/json',
            //"Authorization": "Some token",
            "Access-Control-Allow-Headers": "*"}
      );

      if (response.statusCode == 200) {

        print("pr" + response.body);
        var parsed =  jsonDecode(response.body) as List;
        setState(() {
          studentPrPlolist = parsed.map<String>((e) => e['PLONum']).toList();
          studentPrPloPerlist = parsed.map<String>((e) => e['ploper']).toList();

        });


      } else {
        //data = response.statusCode as String;
        print(response.statusCode);

      }}catch (e) {
      print(e.toString());

    }

  }
  void getPrPloData() async {
    try{
      dynamic body = {
        "pid": "$pid"
      };
      print(body);

      final response = await http.post(Uri.parse(coursePloUrl), body:
      json.encode(body),
          headers: {
            //'Content-Type': 'application/json; charset=UTF-8',
            "Access-Control-Allow-Origin": "*",
            'Content-type': 'application/json',
            'Accept': 'application/json',
            //"Authorization": "Some token",
            "Access-Control-Allow-Headers": "*"}
      );

      if (response.statusCode == 200) {
        print("st" + response.body);
        var parsed =  jsonDecode(response.body) as List;
        setState(() {
          PrPlolist = parsed.map<String>((e) => e['PLONum']).toList();
          PrPloPerlist = parsed.map<String>((e) => e['ploper']).toList();
        });


      } else {
        //data = response.statusCode as String;
        print(response.statusCode);

      }}catch (e) {
      print(e.toString());

    }

  }

  void getAchievedPloData() async {
    try{
      dynamic body = {
        "cid": "$cid",
        "semester": "$semester",
        "year": "$year"
      };


      final response = await http.post(Uri.parse(achievedPloUrl), body:
      json.encode(body),
          headers: {
            //'Content-Type': 'application/json; charset=UTF-8',
            "Access-Control-Allow-Origin": "*",
            'Content-type': 'application/json',
            'Accept': 'application/json',
            //"Authorization": "Some token",
            "Access-Control-Allow-Headers": "*"}
      );

      if (response.statusCode == 200) {

        print("ach" + response.body);
        var parsed =  jsonDecode(response.body) as List;
        setState(() {
          achievedPlolist = parsed.map<String>((e) => e['PLONum']).toList();
          achievedPloPerlist = parsed.map<String>((e) => e['ploper']).toList();

        });


      } else {
        //data = response.statusCode as String;
        print(response.statusCode);

      }}catch (e) {
      print(e.toString());

    }

  }
  void getFailedPloData() async {
    try{
      dynamic body = {
        "cid": "$cid",
        "semester": "$semester",
        "year": "$year"
      };


      final response = await http.post(Uri.parse(failedPloUrl), body:
      json.encode(body),
          headers: {
            //'Content-Type': 'application/json; charset=UTF-8',
            "Access-Control-Allow-Origin": "*",
            'Content-type': 'application/json',
            'Accept': 'application/json',
            //"Authorization": "Some token",
            "Access-Control-Allow-Headers": "*"}
      );

      if (response.statusCode == 200) {

        print("fail" + response.body);
        var parsed =  jsonDecode(response.body) as List;
        setState(() {
          failedPlolist = parsed.map<String>((e) => e['PLONum']).toList();
          failedPloPerlist = parsed.map<String>((e) => e['ploper']).toList();

        });


      } else {
        //data = response.statusCode as String;
        print(response.statusCode);

      }}catch (e) {
      print(e.toString());

    }

  }


  late TextEditingController _controller;
  String prDropdownValue = 'BSc.CSE';
  String courseDropdownValue = 'CSE101';
  String semesterDropdownValue = 'Summer';
  String yearDropdownValue = '2021';


  @override
  void initState() {
    super.initState();
    getStudentPrPloData();
    getPrPloData();
    getAchievedPloData();
    getFailedPloData();
    // TODO: implement initState
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 6),
                  color: lightGrey.withOpacity(.1),
                  blurRadius: 12)
            ],
            border: Border.all(color: lightGrey, width: .5),
          ),
          child: Column(
            children: [
              CustomText(text: 'Student PLO VS Program PLO Average', size: 18, color: Colors.black, weight: FontWeight.bold),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                        width: 600,
                        height: 200,
                        child: GroupedBarChart.withSampleData()),
                  ),
                  Container(
                    width: 1,
                    height: 120,
                    color: lightGrey,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: DropdownButton<String>(
                              value: prDropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  prDropdownValue = newValue!;
                                  pid = prDropdownValue;

                                });
                              },
                              items: <String>['BSc.CEN', 'BSc.CSC', 'BSc.CSE']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Student ID',
                                hintText: '1820243'),onChanged: (String value){ stid = "$value";}
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                getStudentPrPloData();
                                getPrPloData();
                              },
                              child: Text('Submit')),
                        )
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 6),
                  color: lightGrey.withOpacity(.1),
                  blurRadius: 12)
            ],
            border: Border.all(color: lightGrey, width: .5),
          ),
          child: Column(
            children: [
              CustomText(text: 'PLO Achieved VS  PLO Failed', size: 18, color: Colors.black, weight: FontWeight.bold),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                        width: 600,
                        height: 200,
                        child: achVsFailChart.withSampleData()),
                  ),
                  Container(
                    width: 1,
                    height: 120,
                    color: lightGrey,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: DropdownButton<String>(
                            value: courseDropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                courseDropdownValue = newValue!;
                                cid = courseDropdownValue;
                              });
                            },
                            items: <String>['CSE101', 'CSE303', 'CSE425', 'CSE303L']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(child: DropdownButton<String>(
                                  value: semesterDropdownValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      semesterDropdownValue = newValue!;
                                      semester = semesterDropdownValue;
                                    });
                                  },
                                  items: <String>['Summer', 'Spring', 'Autumn']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(child: DropdownButton<String>(
                                  value: yearDropdownValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      yearDropdownValue = newValue!;
                                      year = yearDropdownValue;
                                    });
                                  },
                                  items: <String>['2021', '2020']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: (){print("pressed");
                          //print(plolist);
                          // getStudentPloData();
                          // getCoursePloData();
                          // print("COurse");
                          // print(coursePlolist);
                          // print(coursePloPerlist);
                            // print(semester);
                            // print(year);
                            // print(body);
                            getAchievedPloData();
                             getFailedPloData();


                          }, child: Text('Submit')),
                        )
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }
}
