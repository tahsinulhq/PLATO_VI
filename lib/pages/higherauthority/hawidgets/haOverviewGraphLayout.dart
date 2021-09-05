import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'haBar_Chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:plato_six/widgets/custom_text.dart';

List<dynamic> attemptedPlolist = [];
List<dynamic> attemptedPloPerlist = [];

List<dynamic> achievedPlolist = [];
List<dynamic> achievedPloPerlist = [];


final attemptedPloUrl = 'http://localhost/platoapi/HigherAuthority/AttemptedPLOStdCountapi.php';
final achievedPloUrl = 'http://localhost/platoapi/HigherAuthority/AchievedPLOStdCountapi.php';

String pid = "BSc.CSE";
String semester = 'Summer';
String year = "2021";


class haOverviewGraphLayout extends StatefulWidget {
  @override
  _haOverviewGraphLayoutState createState() => _haOverviewGraphLayoutState();
}

class _haOverviewGraphLayoutState extends State<haOverviewGraphLayout> {
  String prDropdownValue = 'BSc.CSE';
  String semesterDropdownValue = 'Summer';
  String yearDropdownValue = '2021';


  void getAttemptedPloData() async {
    try{
      dynamic body = {
        "pid": "$pid",
        "semester": "$semester",
        "year": "$year"
      };
      print(body);

      final response = await http.post(Uri.parse(attemptedPloUrl), body:
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
        print("att" + response.body);
        var parsed =  jsonDecode(response.body) as List;
        setState(() {
          attemptedPlolist = parsed.map<String>((e) => e['PLONum']).toList();
          attemptedPloPerlist = parsed.map<String>((e) => e['Stcount']).toList();

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
        "pid": "$pid",
        "semester": "$semester",
        "year": "$year"
      };
      print(body);

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
        print(response.body);
        var parsed =  jsonDecode(response.body) as List;
        setState(() {
          achievedPlolist = parsed.map<String>((e) => e['PLONum']).toList();
          achievedPloPerlist = parsed.map<String>((e) => e['Stcount']).toList();
        });


      } else {
        //data = response.statusCode as String;
        print(response.statusCode);

      }}catch (e) {
      print(e.toString());

    }

  }
  @override
  void initState() {

    getAttemptedPloData();
    getAchievedPloData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          CustomText(text: 'Attempted PLO VS Achieved PLO Count', size: 18, color: Colors.black, weight: FontWeight.bold),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: DropdownButton<String>(
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: DropdownButton<String>(
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
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            print("pressed");
                            getAchievedPloData();
                            getAttemptedPloData();
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
    );
  }
}
