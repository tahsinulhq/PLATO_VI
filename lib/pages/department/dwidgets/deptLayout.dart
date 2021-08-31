import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'chart.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


List<dynamic> studentPrPlolist = [];
List<dynamic> studentPrPloPerlist = [];

List<dynamic> PrPlolist = [];
List<dynamic> PrPloPerlist = [];


final studentPloUrl = 'http://localhost/platoapi/Department/StPLOProgramapi.php';
final coursePloUrl = 'http://localhost/platoapi/Department/AvgPLOProgramapi.php';

String pid = "BSc.CSE";
String stid = "1821557";


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


  late TextEditingController _controller;
  String prDropdownValue = 'BSc.CSE';


  @override
  void initState() {
    super.initState();
    getStudentPrPloData();
    getPrPloData();
    // TODO: implement initState
    _controller = TextEditingController();
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
      child: Row(
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
    );
  }
}
