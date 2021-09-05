import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'haBar_Chart.dart';
import 'haBar_Chart2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:plato_six/widgets/custom_text.dart';

List<dynamic> attemptedPlolist = [];
List<dynamic> attemptedPloPerlist = [];

List<dynamic> achievedPlolist = [];
List<dynamic> achievedPloPerlist = [];

List<dynamic> deptPloCount = [];
List<dynamic> deptPloStdCount = [];



final attemptedPloUrl =
    'http://localhost/platoapi/HigherAuthority/AttemptedPLOStdCountapi.php';
final achievedPloUrl =
    'http://localhost/platoapi/HigherAuthority/AchievedPLOStdCountapi.php';

final deptPloUrl =
    'http://localhost/platoapi/HigherAuthority/MiscAvgPLOCountDeptapi.php';

String pid = "BSc.CSE";
String semester = 'Summer';
String year = "2021";
String did = "CSE";

String stSemester = 'Spring';
String endSemester = 'Summer';
String passingSemester = 'Spring';
String passingYear = '2021';

String stYear = "2021";
String endYear = "2021";



class haOverviewGraphLayout extends StatefulWidget {
  @override
  _haOverviewGraphLayoutState createState() => _haOverviewGraphLayoutState();
}

class _haOverviewGraphLayoutState extends State<haOverviewGraphLayout> {
  String prDropdownValue = 'BSc.CSE';
  String semesterDropdownValue = 'Summer';
  String yearDropdownValue = '2021';

  String deptDropdownValue = 'CSE';
  String stSemesterDropdownValue = 'Summer';
  String endSemesterDropdownValue = 'Spring';
  String stYearDropdownValue = '2021';
  String endYearDropdownValue = '2021';

  void getAttemptedPloData() async {
    try {
      dynamic body = {"pid": "$pid", "semester": "$semester", "year": "$year"};
      print(body);

      final response = await http
          .post(Uri.parse(attemptedPloUrl), body: json.encode(body), headers: {
        //'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
        'Content-type': 'application/json',
        'Accept': 'application/json',
        //"Authorization": "Some token",
        "Access-Control-Allow-Headers": "*"
      });

      if (response.statusCode == 200) {
        print("att" + response.body);
        var parsed = jsonDecode(response.body) as List;
        setState(() {
          attemptedPlolist = parsed.map<String>((e) => e['PLONum']).toList();
          attemptedPloPerlist =
              parsed.map<String>((e) => e['Stcount']).toList();
        });
      } else {
        //data = response.statusCode as String;
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void getAchievedPloData() async {
    try {
      dynamic body = {"pid": "$pid", "semester": "$semester", "year": "$year"};
      print(body);

      final response = await http
          .post(Uri.parse(achievedPloUrl), body: json.encode(body), headers: {
        //'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
        'Content-type': 'application/json',
        'Accept': 'application/json',
        //"Authorization": "Some token",
        "Access-Control-Allow-Headers": "*"
      });

      if (response.statusCode == 200) {
        print(response.body);
        var parsed = jsonDecode(response.body) as List;
        setState(() {
          achievedPlolist = parsed.map<String>((e) => e['PLONum']).toList();
          achievedPloPerlist = parsed.map<String>((e) => e['Stcount']).toList();
        });
      } else {
        //data = response.statusCode as String;
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void getAvgDeptPloData() async {

    try {
      dynamic body = {"did": "$did", "semester": "$passingSemester", "year": "$passingYear"};
      print(body);

      final response = await http
          .post(Uri.parse(deptPloUrl), body: json.encode(body), headers: {
        //'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
        'Content-type': 'application/json',
        'Accept': 'application/json',
        //"Authorization": "Some token",
        "Access-Control-Allow-Headers": "*"
      });

      if (response.statusCode == 200) {
        deptPloCount.clear();
        deptPloStdCount.clear();
        print(response.body);
        List<dynamic> tempdeptPloCount = [];
        List<dynamic> tempdeptPloStdCount = [];

        var parsed = jsonDecode(response.body) as List;

          tempdeptPloCount = parsed.map<String>((e) => e['PLONum']).toList();
          tempdeptPloStdCount = parsed.map<String>((e) => e['Stcount']).toList();
          print("tempdpt" );
          print(tempdeptPloStdCount);

          setState(() {
            if (deptPloStdCount.isEmpty == true){

              for (int i=0; i<tempdeptPloStdCount.length; i++){

                deptPloStdCount.add(tempdeptPloStdCount[i]);

              }}
            else if(tempdeptPloStdCount.isEmpty == true){
              deptPloStdCount = deptPloStdCount;
            }
            else{
              for (int i=0; i<deptPloStdCount.length; i++){

                deptPloStdCount[i] = deptPloStdCount[i] + tempdeptPloStdCount[i];

              }
            }

            var temp = null;

            if (deptPloCount.isEmpty == true){
              for (int i=0; i<tempdeptPloCount.length; i++){

                deptPloCount.add(tempdeptPloCount[i]);

              }


            }
            else{
            for (int i=0; i<tempdeptPloCount.length; i++){
              for(int j =0; j<deptPloCount.length; j++){

                if(tempdeptPloCount[i] == deptPloCount[j] ){
                  temp = null;
                  break;

                }

                temp = tempdeptPloCount[i];

              }
              if(temp != null)
                deptPloCount.add(temp);


            }}
            print("tempdpt hi" );
            print(deptPloCount);


          });



      } else {
        //data = response.statusCode as String;
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
  void getTimeFrame() async {
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

    for (int i=0; i<deptPloStdCount.length; i++){

      deptPloStdCount[i] = deptPloStdCount[i]/ timeFrame;

}
    currSem = stSemester;
    print('PLO');
    print(deptPloCount);
    print('std Count');
    print(deptPloStdCount);




  }

  @override
  void initState() {
    getAttemptedPloData();
    getAchievedPloData();
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
              CustomText(
                  text: 'Attempted PLO VS Achieved PLO Count',
                  size: 18,
                  color: Colors.black,
                  weight: FontWeight.bold),
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
                              items: <String>[
                                'BSc.CEN',
                                'BSc.CSC',
                                'BSc.CSE'
                              ].map<DropdownMenuItem<String>>((String value) {
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
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
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
                                  value: yearDropdownValue,
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
                                      yearDropdownValue = newValue!;
                                      year = yearDropdownValue;
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
        ),
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
                  text: 'Dept Plo average student count',
                  size: 18,
                  color: Colors.black,
                  weight: FontWeight.bold),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                        width: 600,
                        height: 200,
                        child: HaBarChart.withSampleData()),
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
                                print(deptPloCount);

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
        )
      ],
    );
  }
}
