import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/pages/overview/owidgets/bar_chart.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<dynamic> studentPlolist = [];
List<dynamic> studentPloPerlist = [];

List<dynamic> coursePlolist = [];
List<dynamic> coursePloPerlist = [];


final studentPloUrl = 'http://localhost/platoapi/Instructor/AvgPLOGraphapi.php';
final coursePloUrl = 'http://localhost/platoapi/Instructor/AvgPLOCourseGraphapi.php';

String cid = "CSE303";
String stid = "1821557";
String semester = "Summer";
String year = "2021";



class RevenueSectionLarge extends StatefulWidget {

  @override
  State<RevenueSectionLarge> createState() => _RevenueSectionLargeState();
}

class _RevenueSectionLargeState extends State<RevenueSectionLarge> {


  void getStudentPloData() async {
    try{
      dynamic body = {
        "cid": "$cid",
        "stid": "$stid",
        "semester": "$semester",
        "year": "$year"
      };
      print(body);

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
        var parsed =  jsonDecode(response.body) as List;
        setState(() {
          studentPlolist = parsed.map<String>((e) => e['PLONum']).toList();
          studentPloPerlist = parsed.map<String>((e) => e['ploper']).toList();

        });


      } else {
        //data = response.statusCode as String;
        print(response.statusCode);

      }
      }
      catch (e) {
      print(e.toString());

    }

  }

  void getCoursePloData() async {
    try{
      dynamic body = {
        "cid": "$cid"
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
        print(response.body);
        var parsed =  jsonDecode(response.body) as List;
        setState(() {
          coursePlolist = parsed.map<String>((e) => e['PLONum']).toList();
          coursePloPerlist = parsed.map<String>((e) => e['ploper']).toList();
        });


      } else {
        //data = response.statusCode as String;
        print(response.statusCode);

      }}catch (e) {
      print(e.toString());

    }

  }


  late TextEditingController _controller;
  String courseDropdownValue = 'CSE101';
  String semesterDropdownValue = 'Summer';
  String yearDropdownValue = '2021';

  @override
  void initState() {
    super.initState();
    getStudentPloData();
    getCoursePloData();
    // TODO: implement initState
    _controller = TextEditingController();

  }
  @override
  Widget build(BuildContext context) {
    return  Container(
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
          CustomText(text: 'Student PLO VS Course PLO Average', size: 18, color: Colors.black, weight: FontWeight.bold),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 4,
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
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Student ID',
                          hintText: '1820243',
                        ),
                        onChanged: (String value){ stid = "$value";}

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: (){print("pressed");
                      //print(plolist);
                      getStudentPloData();
                      getCoursePloData();
                      print("COurse");
                      print(coursePlolist);
                      print(coursePloPerlist);
                      // print(semester);
                      // print(year);
                     // print(body);


                      }, child: Text('Submit')),
                    )

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}