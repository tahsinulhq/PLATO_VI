import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/pages/department/dwidgets/chart%202.dart';
import 'package:plato_six/pages/department/dwidgets/chart3.dart';
import 'chart4.dart';
import 'chart.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';


List<dynamic> studentPrPlolist = [];
List<dynamic> studentPrPloPerlist = [];

List<dynamic> PrPlolist = [];
List<dynamic> PrPloPerlist = [];

List<dynamic> achievedPlolist = [];
List<dynamic> achievedPloPerlist = [];

List<dynamic> failedPlolist = [];
List<dynamic> failedPloPerlist = [];

List<dynamic> insName = [];
List<dynamic> insPloPerlist = [];
List<dynamic> insPlolist = [];

List<int> test1 = [];
List<int> test2 = [];

List<dynamic> tempPloCourse = [];
List<dynamic> tempPloPer = [];


List<dynamic> semPloCourse = [];
List<dynamic> semPloPer = [];

const ticks = [0, 20, 40, 60, 80, 90];



final studentPloUrl = 'http://localhost/platoapi/Department/StPLOProgramapi.php';
final coursePloUrl = 'http://localhost/platoapi/Department/AvgPLOProgramapi.php';

final achievedPloUrl = 'http://localhost/platoapi/Department/AchievedPLOCourseapi.php';
final failedPloUrl = 'http://localhost/platoapi/Department/FailedPLOCourseapi.php';

 final instructorPLOCourseUrl = 'http://localhost/platoapi/Department/InstructorPLOCourseapi.php';

 final ploSemesterWise = "http://localhost/platoapi/Department/SelectedPLOCompCourseapi.php";


String pid = "BSc.CSE";
String stid = "1821557";

String cid = "CSE303";
String semester = "Summer";
String year = "2021";

String icid = "CSE303";
String isemester = "Summer";
String iyear = "2021";
String iplo = "PO1";

String stSemester = 'Spring';
String endSemester = 'Summer';
String passingSemester = 'Spring';
String passingYear = '2021';
String plo = 'PO2';

String stYear = "2021";
String endYear = "2021";

String deptDropdownValue = 'CSE';
String stSemesterDropdownValue = 'Spring';
String endSemesterDropdownValue = 'Summer';
String stYearDropdownValue = '2021';
String endYearDropdownValue = '2021';
String ploDropdownValue = 'PO1';


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

          //test
          for(int i =0; i< studentPrPloPerlist.length; i++){
            double a= double.parse(studentPrPloPerlist[i]);

            test1.add(a.round());

          }
          print("test1");
          print(test1);

        });


        // setState(() {
        //   test1;
        //
        // });

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
          
          for(int i =0; i< PrPloPerlist.length; i++){
            double a= double.parse(PrPloPerlist[i]);

            test2.add(a.round());
            print("test2");
            print(test2);
          }

        });

        //test

        // setState(() {
        //   test2;
        //
        // });


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
         achievedPlolist.clear();
         achievedPloPerlist.clear();

        print("ach" + response.body);
        var parsed =  jsonDecode(response.body) as List;
        setState(() {
          achievedPlolist = parsed.map<String>((e) => e['PLONum']).toList();
          achievedPloPerlist = parsed.map<String>((e) => e['perstd']).toList();

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
        failedPlolist.clear();
        failedPloPerlist.clear();

        print("fail" + response.body);
        var parsed =  jsonDecode(response.body) as List;
        setState(() {
          failedPlolist = parsed.map<String>((e) => e['PLONum']).toList();
          failedPloPerlist = parsed.map<String>((e) => e['perstd']).toList();

        });


      } else {
        //data = response.statusCode as String;
        print(response.statusCode);

      }}catch (e) {
      print(e.toString());

    }

  }

  void getInstructorWisePLO() async {
    try{
      dynamic body = {
        "cid": "$icid",
        "semester": "$isemester",
        "year": "$iyear",
      "plo": "$iplo",
      };

      final response = await http.post(Uri.parse(instructorPLOCourseUrl), body:
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
        // achievedPlolist.clear();
        // achievedPloPerlist.clear();

        print("ins" + response.body);
        var parsed =  jsonDecode(response.body) as List;
        setState(() {
          insPlolist = parsed.map<String>((e) => e['PLONum']).toList();
          insName = parsed.map<String>((e) => e['name']).toList();
          insPloPerlist = parsed.map<String>((e) => e['ploper']).toList();

        });


      } else {
        //data = response.statusCode as String;
        print(response.statusCode);

      }}catch (e) {
      print(e.toString());

    }

  }

  void getAvgDeptPloData() async {

    try {
      dynamic body = {"plo": "$plo", "semester": "$passingSemester", "year": "$passingYear"};
      print(passingSemester);

      final response = await http
          .post(Uri.parse(ploSemesterWise), body: json.encode(body), headers: {
        //'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
        'Content-type': 'application/json',
        'Accept': 'application/json',
        //"Authorization": "Some token",
        "Access-Control-Allow-Headers": "*"
      });

      if (response.statusCode == 200) {
        // deptPloCount.clear();
        // deptPloStdCount.clear();

        tempPloCourse.clear();
        tempPloPer.clear();

        var parsed = jsonDecode(response.body) as List;
        print(response.body);

        tempPloCourse = await parsed.map<String>((e) => e['CourseID']).toList();
        tempPloPer = await parsed.map<String>((e) => e['ploper']).toList();
        print("tempdpt" );
        print(tempPloPer);
        print("length" );
        print(tempPloPer.length);


        if (semPloPer.isEmpty == true){

          for (int i=0; i<tempPloPer.length; i++){

            semPloPer.add(tempPloPer[i]);

          }
          setState(() {
            semPloPer;
          });
        }
        else if(tempPloPer.isEmpty == true){
          // deptPloStdCount = deptPloStdCount;
        }
        else{
          if(semPloPer.length == tempPloPer.length){
            for (int i=0; i<tempPloPer.length; i++){
              semPloPer[i] = (int.parse(semPloPer[i] )+ int.parse(tempPloPer[i])).toString();}
          }

          for (int i=0; i<tempPloPer.length; i++){
            if(semPloPer.length != tempPloPer.length){
              for (int j= 0; j<semPloPer.length ; j++){
                semPloPer[j] = (int.parse(semPloPer[j] )+ int.parse(tempPloPer[j])).toString();
                i =j++;
              }
              semPloPer.add(tempPloPer[i]);
            }
          }




          setState(() {
            semPloPer;
          });
          print('test');
          print(semPloPer);
        }

        var temp = null;

        if (semPloCourse.isEmpty == true){
          for (int i=0; i<tempPloCourse.length; i++){

            semPloCourse.add(tempPloCourse[i]);

          }
          setState(() {
            semPloCourse;
          });


        }
        else{
          for (int i=0; i<tempPloCourse.length; i++){
            for(int j =0; j<semPloCourse.length; j++){

              if(tempPloCourse[i] == semPloCourse[j] ){
                temp = null;
                break;

              }

              temp = tempPloCourse[i];

            }
            if(temp != null)
              semPloCourse.add(temp);


          }

          setState(() {
            semPloCourse;
          });
        }







      } else {
        //data = response.statusCode as String;
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
  void getTimeFrame()  {
    semPloPer.clear();
    semPloCourse.clear();
    passingYear="";
    passingSemester = "";
    var stSemVal;
    var endSemVal;
    var timeFrame;
    var semDif;
    int year;
    var currSem = stSemester;
    int currYear = int.parse(stYear);

    if(stSemester == "Spring"){
      stSemVal = 1;
    }
    else if (stSemester == "Summer"){
      stSemVal = 2;
    }
    else if (stSemester == "Autumn"){
      stSemVal = 3;
    }

    if(endSemester == "Spring"){
      endSemVal = 1;
    }
    else if (endSemester == "Summer"){
      endSemVal = 2;
    }
    else if (endSemester == "Autumn"){
      endSemVal = 3;
    }

    semDif = endSemVal - stSemVal;
    semDif = semDif.abs();
    year = int.parse(endYear) - int.parse(stYear);

    if (year == 0){
      timeFrame = semDif + 1;
    }
    else if(semDif == 0 && year !=0){
      semDif = 3;
      timeFrame = (semDif*year)+1;
    }
    else if(semDif != 0 && year !=0){
      timeFrame = (semDif +(year*3))+1;
    }
    print("time" );
    print(timeFrame);

    for (int i = 0; i<timeFrame; i++){
      if(currSem == 'Spring'){
        setState(() {
          passingSemester = currSem;
          passingYear = currYear.toString();
        });
        getAvgDeptPloData();


        currSem = 'Summer';
      }
      else if (currSem == 'Summer'){
        setState(() {
          passingSemester = currSem;
          passingYear = currYear.toString();
        });
        getAvgDeptPloData();
        currSem = 'Autumn';
      }
      else if (currSem == 'Autumn'){
        setState(() {
          passingSemester = currSem;
          passingYear = currYear.toString();
        });
        getAvgDeptPloData();

        currSem = 'Spring';
        currYear++;
      }


    }
    // for (int i=0; i<deptPloStdCount.length; i++){
    //
    //   deptPloStdCount[i] = (double.parse(deptPloStdCount[i])/ timeFrame).toString();
    //
    // }
    //
    // setState(() {
    //   deptPloStdCount;
    // });
    //
    //
    // currSem = stSemester;
    // print('PLO');
    // print(deptPloCount);
    // print('std Count');
    // print(deptPloStdCount);




  }


  late TextEditingController _controller;
  String prDropdownValue = 'BSc.CSE';
  String courseDropdownValue = 'CSE101';
  String semesterDropdownValue = 'Summer';
  String yearDropdownValue = '2021';

  String insCourseDropdownValue = 'CSE101';
  String insSemesterDropdownValue = 'Summer';
  String insYearDropdownValue = '2021';
  String insploDropdownValue = 'PO1';


  @override
  void initState() {
    super.initState();
    getStudentPrPloData();
    getPrPloData();
    getAchievedPloData();
    getFailedPloData();
    getInstructorWisePLO();
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
                          print(semester);
                            getAchievedPloData();
                             getFailedPloData();


                          }, child: Text('Submit')),
                        ),

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
              CustomText(text: 'Instructor Wise PLO ', size: 18, color: Colors.black, weight: FontWeight.bold),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                        width: 600,
                        height: 200,
                        child: insPlo.withSampleData()),
                  ),
                  Container(
                    width: 1,
                    height: 120,
                    color: lightGrey,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Container(child: DropdownButton<String>(
                          value: insCourseDropdownValue,
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
                              insCourseDropdownValue = newValue!;
                              icid = insCourseDropdownValue;
                            });
                          },
                          items: <String>['CSE101', 'CSE303', 'CSE425', 'CSE303L']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: DropdownButton<String>(
                                  value: insploDropdownValue,
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
                                      insploDropdownValue = newValue!;
                                      iplo = insploDropdownValue;
                                    });
                                  },
                                  items: <String>[
                                    'PO1',
                                    'PO2',
                                    'PO3',
                                    'PO4',
                                    'PO5',
                                    'PO6',
                                    'PO7',
                                    'PO8',
                                    'PO9',
                                    'PO10',
                                    'PO11',
                                    'PO12',
                                    'PO13'
                                  ].map<DropdownMenuItem<String>>((String value) {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(child: DropdownButton<String>(
                                  value: insSemesterDropdownValue,
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
                                      insSemesterDropdownValue = newValue!;
                                      isemester = insSemesterDropdownValue;
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
                                  value: insYearDropdownValue,
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
                                      insYearDropdownValue = newValue!;
                                      iyear = insYearDropdownValue;
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

                          getInstructorWisePLO();


                          }, child: Text('Submit')),
                        ),

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
              CustomText(
                  text: 'PLO Comparison Among Courses',
                  size: 18,
                  color: Colors.black,
                  weight: FontWeight.bold),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                        width: 600,
                        height: 200,
                        child: SemBarChart.withSampleData()),
                  ),
                  Container(
                    width: 1,
                    height: 120,
                    color: lightGrey,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: DropdownButton<String>(
                                  value: deptDropdownValue,
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
                                      deptDropdownValue = newValue!;
                                      pid = deptDropdownValue;
                                    });
                                  },
                                  items: <String>[
                                    'CEN',
                                    'CSC',
                                    'CSE'
                                  ].map<DropdownMenuItem<String>>((String value) {
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
                                  value: ploDropdownValue,
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
                                      ploDropdownValue = newValue!;
                                      plo = ploDropdownValue;
                                    });
                                  },
                                  items: <String>[
                                    'PO1',
                                    'PO2',
                                    'PO3',
                                    'PO4',
                                    'PO5',
                                    'PO6',
                                    'PO7',
                                    'PO8',
                                    'PO9',
                                    'PO10',
                                    'PO11',
                                    'PO12',
                                    'PO13'
                                  ].map<DropdownMenuItem<String>>((String value) {
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
                        CustomText(
                            text: 'From',
                            size: 16,
                            color: Colors.black,
                            weight: FontWeight.normal),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: DropdownButton<String>(
                                  value: stSemesterDropdownValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style:
                                  const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      stSemesterDropdownValue = newValue!;
                                      stSemester = stSemesterDropdownValue;
                                    });
                                  },
                                  items: <String>['Summer', 'Spring', 'Autumn']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                                  value: stYearDropdownValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style:
                                  const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      stYearDropdownValue = newValue!;
                                      stYear = stYearDropdownValue;
                                    });
                                  },
                                  items: <String>['2021', '2020']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                        CustomText(
                            text: 'To',
                            size: 16,
                            color: Colors.black,
                            weight: FontWeight.normal),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: DropdownButton<String>(
                                  value: endSemesterDropdownValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style:
                                  const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      endSemesterDropdownValue = newValue!;
                                      endSemester = endSemesterDropdownValue;
                                    });
                                  },
                                  items: <String>['Summer', 'Spring', 'Autumn']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                                  value: endYearDropdownValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style:
                                  const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      endYearDropdownValue = newValue!;
                                      endYear = endYearDropdownValue;
                                    });
                                  },
                                  items: <String>['2021', '2020']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                                // getAchievedPloData();
                                // getAttemptedPloData();
                                getTimeFrame();
                                print("button");
                                // print(deptPloCount);

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
          height: 500,
          width: 500,
          child: RadarChart.light(
            ticks: ticks,
            features: studentPrPlolist.cast<String>(),
            data: [test1, test2]

          ),

        ),

      ],
    );
  }
}


