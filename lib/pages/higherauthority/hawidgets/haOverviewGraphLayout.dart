import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'haBar_Chart.dart';
import 'haBar_Chart2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:plato_six/widgets/custom_text.dart';
import 'haBar_chart3.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

List<dynamic> attemptedPlolist = [];
List<dynamic> attemptedPloPerlist = [];

List<dynamic> achievedPlolist = [];
List<dynamic> achievedPloPerlist = [];

List<dynamic> deptPloCount = [];
List<dynamic> deptPloStdCount = [];


List<dynamic> tempdeptPloCount = [];
List<dynamic> tempdeptPloStdCount = [];

List<dynamic> deptPloperCount = [];
List<dynamic> deptPloperStdCount = [];

List<dynamic> tempdeptPloperCount = [];
List<dynamic> tempdeptPloperStdCount = [];


List<dynamic> uniPloperCount = [];
List<int> uniPloperStdCount = [];

List<dynamic> tempuniPloperCount = [];
List<dynamic> tempuniPloperStdCount = [];
final attemptedPloUrl =
    'http://localhost/platoapi/HigherAuthority/AttemptedPLOStdCountapi.php';
final achievedPloUrl =
    'http://localhost/platoapi/HigherAuthority/AchievedPLOStdCountapi.php';

final deptPloUrl =
    'http://localhost/platoapi/HigherAuthority/MiscAvgPLOCountDeptapi.php';

final deptploperUrl = "http://localhost/platoapi/HigherAuthority/MiscPLOPerCountStddeptapi.php";

final uniPloUrl = "http://localhost/platoapi/HigherAuthority/UniAchievedPLOCountProgramapi.php";

String pid = "BSc.CSE";
String semester = 'Summer';
String year = "2021";
String did = "CSE";

String semester2 = 'Summer';
String year2 = "2021";
String did2 = "CSE";

String stSemester = 'Spring';
String endSemester = 'Summer';
String passingSemester = 'Spring';
String passingYear = '2021';

String stYear = "2021";
String endYear = "2021";
var timeFrame;

String stSemester2 = 'Spring';
String endSemester2 = 'Summer';
String passingSemester2 = 'Spring';
String passingYear2 = '2021';

String stYear2 = "2021";
String endYear2 = "2021";
var timeFrame2;

String rpid = "BSc.CSE";
String rsemester = 'Summer';
String ryear3 = "2021";
String ruid = "IUB";

String rstSemester = 'Spring';
String rendSemester = 'Summer';
String rpassingSemester = 'Spring';
String rpassingYear = '2021';
String rstYear = "2021";
String rendYear = "2021";
var rtimeFrame;



const ticks = [0, 20, 40, 60, 80, 100];


class haOverviewGraphLayout extends StatefulWidget {
  @override
  _haOverviewGraphLayoutState createState() => _haOverviewGraphLayoutState();
}

class _haOverviewGraphLayoutState extends State<haOverviewGraphLayout> {
  String prDropdownValue = 'BSc.CSE';
  String semesterDropdownValue = 'Summer';
  String yearDropdownValue = '2021';

  String deptDropdownValue = 'CSE';
  String stSemesterDropdownValue = 'Spring';
  String endSemesterDropdownValue = 'Summer';
  String stYearDropdownValue = '2021';
  String endYearDropdownValue = '2021';

  String deptDropdownValue2 = 'CSE';
  String stSemesterDropdownValue2 = 'Spring';
  String endSemesterDropdownValue2 = 'Summer';
  String stYearDropdownValue2 = '2021';
  String endYearDropdownValue2 = '2021';

  String rstSemesterDropdownValue= 'Spring';
  String rendSemesterDropdownValue = 'Summer';
  String rstYearDropdownValue = '2021';
  String rendYearDropdownValue = '2021';
  String rprDropdownValue = 'BSc.CSE';
  String rUniDropdownValue = 'BSc.CSE';


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
       // deptPloCount.clear();
        // deptPloStdCount.clear();

         tempdeptPloCount.clear();
         tempdeptPloStdCount.clear();

        var parsed = jsonDecode(response.body) as List;

           tempdeptPloCount = await parsed.map<String>((e) => e['PLONum']).toList();
          tempdeptPloStdCount = await parsed.map<String>((e) => e['Stcount']).toList();
          print("tempdpt" );
         print(tempdeptPloStdCount);
         print("length" );
         print(tempdeptPloStdCount.length);


            if (deptPloStdCount.isEmpty == true){

              for (int i=0; i<tempdeptPloStdCount.length; i++){

                deptPloStdCount.add(tempdeptPloStdCount[i]);

              }
            setState(() {
              deptPloStdCount;
            });
            }
            else if(tempdeptPloStdCount.isEmpty == true){
              // deptPloStdCount = deptPloStdCount;
            }
            else{
              print('test');
              print(deptPloStdCount);
              if(deptPloStdCount.length == tempdeptPloStdCount.length){
              for (int i=0; i<tempdeptPloStdCount.length; i++){
                deptPloStdCount[i] = (int.parse(deptPloStdCount[i] )+ int.parse(tempdeptPloStdCount[i])).toString();}
              }


              for (int i=0; i<tempdeptPloStdCount.length; i++){
                if(deptPloStdCount.length != tempdeptPloStdCount.length){
                  for (int j= 0; j<deptPloStdCount.length ; j++){
                    deptPloStdCount[j] = (int.parse(deptPloStdCount[j] )+ int.parse(tempdeptPloStdCount[j])).toString();
                     i =j++;

                  }}
                else
                  deptPloStdCount.add(tempdeptPloStdCount[i]);}

              setState(() {
                deptPloStdCount;
              });
              print('test');
              print(deptPloStdCount);
            }

            var temp = null;

            if (deptPloCount.isEmpty == true){
              for (int i=0; i<tempdeptPloCount.length; i++){

                deptPloCount.add(tempdeptPloCount[i]);

              }
              setState(() {
                deptPloCount;
              });


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


            }

            setState(() {
              deptPloCount;
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
    deptPloCount.clear();
    deptPloStdCount.clear();
    passingYear="";
    passingSemester = "";
    var stSemVal;
    var endSemVal;

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
    print("abcd");
    print(deptPloStdCount.length);
  // for (int i=0; i<deptPloStdCount.length; i++){
  //   print("abcd");
  //   print((double.parse(deptPloStdCount[i])/ timeFrame).toString());
  //   deptPloStdCount[i] = (double.parse(deptPloStdCount[i])/ timeFrame).toString();
  //
  // }
  //
  // setState(() {
  //   deptPloStdCount2;
  // });


    // currSem = stSemester;
    // print('PLO');
    // print(deptPloCount);
    // print('std Count');
    // print(deptPloStdCount);




  }

  void getPerDeptPloData() async {

    try {
      dynamic body = {"did": "$did2", "semester": "$passingSemester2", "year": "$passingYear2"};
      print(passingSemester2);

      final response = await http
          .post(Uri.parse(deptploperUrl), body: json.encode(body), headers: {
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

        tempdeptPloperCount.clear();
        tempdeptPloperStdCount.clear();

        var parsed = jsonDecode(response.body) as List;
        print(response.body);

        tempdeptPloperCount = await parsed.map<String>((e) => e['PLONum']).toList();
        tempdeptPloperStdCount = await parsed.map<String>((e) => e['perstd']).toList();
        print("tempdpt" );
        //tempPloCourse
        // print(tempPloPer);
        // print("length" );
        // print(tempPloPer.length);


        if (tempdeptPloperStdCount.isEmpty == true){

          for (int i=0; i<tempdeptPloperStdCount.length; i++){

            deptPloperStdCount.add(tempdeptPloperStdCount[i]);

          }
          setState(() {
            deptPloperStdCount;
          });
        }
        else if(tempdeptPloperStdCount.isEmpty == true){
          // deptPloStdCount = deptPloStdCount;
        }
        else{
          if(deptPloperStdCount.length == tempdeptPloperStdCount.length){
            for (int i=0; i<tempdeptPloperStdCount.length; i++){
              deptPloperStdCount[i] = (int.parse(deptPloperStdCount[i] )+ int.parse(tempdeptPloperStdCount[i])).toString();}
          }

          for (int i=0; i<tempdeptPloperStdCount.length; i++){
            if(deptPloperStdCount.length != tempdeptPloperStdCount.length){
              for (int j= 0; j<deptPloperStdCount.length ; j++){
                deptPloperStdCount[j] = (int.parse(deptPloperStdCount[j] )+ int.parse(tempdeptPloperStdCount[j])).toString();
                i =j++;
              }
              deptPloperStdCount.add(tempdeptPloperStdCount[i]);
            }
          }




          setState(() {
            deptPloperStdCount;
          });
          print('test');
          print(deptPloperStdCount);
        }

        var temp = null;

        if (deptPloperCount.isEmpty == true){
          for (int i=0; i<tempdeptPloperCount.length; i++){

            deptPloperCount.add(tempdeptPloperCount[i]);

          }
          setState(() {
            deptPloperCount;
          });


        }
        else{
          for (int i=0; i<tempdeptPloperCount.length; i++){
            for(int j =0; j<deptPloperCount.length; j++){

              if(tempdeptPloperCount[i] == deptPloperCount[j] ){
                temp = null;
                break;

              }

              temp = tempdeptPloperCount[i];

            }
            if(temp != null)
              deptPloperCount.add(temp);


          }

          setState(() {
            deptPloperCount;
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
  void getTimeFrame2()  {
    deptPloperCount.clear();
    deptPloperStdCount.clear();
    passingYear2="";
    passingSemester2 = "";
    var stSemVal;
    var endSemVal;
    var timeFrame;
    var semDif;
    int year;
    var currSem = stSemester2;
    int currYear = int.parse(stYear2);

    if(stSemester2 == "Spring"){
      stSemVal = 1;
    }
    else if (stSemester2 == "Summer"){
      stSemVal = 2;
    }
    else if (stSemester2 == "Autumn"){
      stSemVal = 3;
    }

    if(endSemester2 == "Spring"){
      endSemVal = 1;
    }
    else if (endSemester2 == "Summer"){
      endSemVal = 2;
    }
    else if (endSemester2 == "Autumn"){
      endSemVal = 3;
    }

    semDif = endSemVal - stSemVal;
    semDif = semDif.abs();
    year = int.parse(endYear2) - int.parse(stYear2);

    if (year == 0){
      timeFrame2 = semDif + 1;
    }
    else if(semDif == 0 && year !=0){
      semDif = 3;
      timeFrame2 = (semDif*year)+1;
    }
    else if(semDif != 0 && year !=0){
      timeFrame2 = (semDif +(year*3))+1;
    }
    print("time2" );
    print(timeFrame2);

    for (int i = 0; i<timeFrame2; i++){
      if(currSem == 'Spring'){
        setState(() {
          passingSemester2 = currSem;
          passingYear2 = currYear.toString();
        });
        getPerDeptPloData();


        currSem = 'Summer';
      }
      else if (currSem == 'Summer'){
        setState(() {
          passingSemester2 = currSem;
          passingYear2 = currYear.toString();
        });
        getPerDeptPloData();
        currSem = 'Autumn';
      }
      else if (currSem == 'Autumn'){
        setState(() {
          passingSemester2 = currSem;
          passingYear2 = currYear.toString();
        });
        getPerDeptPloData();

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

  void rgetPerDeptPloData() async {

    try {
      dynamic body = {"uid": "$ruid", "pid": "$rpid", "semester": "$rpassingSemester", "year": "$rpassingYear"};
      print(rpassingSemester);

      final response = await http
          .post(Uri.parse(uniPloUrl), body: json.encode(body), headers: {
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

        tempuniPloperCount.clear();
        tempuniPloperStdCount.clear();

        var parsed = jsonDecode(response.body) as List;
        print(response.body);

        tempuniPloperCount = await parsed.map<String>((e) => e['PLONum']).toList();
        tempuniPloperStdCount = await parsed.map<String>((e) => e['perstd']).toList();
        print("tempdpt" );
        //tempPloCourse
        // print(tempPloPer);
        // print("length" );
        // print(tempPloPer.length);


        if (tempuniPloperStdCount.isEmpty == true){

          for (int i=0; i<tempuniPloperStdCount.length; i++){

            uniPloperStdCount.add(tempuniPloperStdCount[i]);

          }
          setState(() {
            uniPloperStdCount;
          });
        }
        else if(tempuniPloperStdCount.isEmpty == true){
          // deptPloStdCount = deptPloStdCount;
        }
        else{
          if(uniPloperStdCount.length == tempuniPloperStdCount.length){
            for (int i=0; i<tempuniPloperStdCount.length; i++){
              uniPloperStdCount[i] = uniPloperStdCount[i] + int.parse(tempuniPloperStdCount[i]);}
          }

          for (int i=0; i<tempuniPloperStdCount.length; i++){
            if(uniPloperStdCount.length != tempuniPloperStdCount.length){
              for (int j= 0; j<uniPloperStdCount.length ; j++){
                uniPloperStdCount[j] = uniPloperStdCount[j] + int.parse(tempuniPloperStdCount[j]);
                i =j++;
              }
              uniPloperStdCount.add(tempuniPloperStdCount[i]);
            }
          }




          setState(() {
            uniPloperStdCount;
          });
          print('test');
          print(uniPloperStdCount);
        }

        var temp = null;

        if (uniPloperCount.isEmpty == true){
          for (int i=0; i<tempuniPloperCount.length; i++){

            uniPloperCount.add(tempuniPloperCount[i]);

          }
          setState(() {
            uniPloperCount;
          });


        }
        else{
          for (int i=0; i<tempuniPloperCount.length; i++){
            for(int j =0; j<uniPloperCount.length; j++){

              if(tempuniPloperCount[i] == uniPloperCount[j] ){
                temp = null;
                break;

              }

              temp = tempuniPloperCount[i];

            }
            if(temp != null)
              uniPloperCount.add(temp);


          }

          setState(() {
            uniPloperCount;
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
  void rgetTimeFrame()  {
    uniPloperCount.clear();
    uniPloperStdCount.clear();
    rpassingYear="";
   rpassingSemester = "";
    var stSemVal;
    var endSemVal;
    var timeFrame;
    var semDif;
    int year;
    var currSem = rstSemester;
    int currYear = int.parse(rstYear);

    if(rstSemester == "Spring"){
      stSemVal = 1;
    }
    else if (rstSemester == "Summer"){
      stSemVal = 2;
    }
    else if (rstSemester == "Autumn"){
      stSemVal = 3;
    }

    if(rendSemester == "Spring"){
      endSemVal = 1;
    }
    else if (rendSemester == "Summer"){
      endSemVal = 2;
    }
    else if (rendSemester == "Autumn"){
      endSemVal = 3;
    }

    semDif = endSemVal - stSemVal;
    semDif = semDif.abs();
    year = int.parse(rendYear) - int.parse(rstYear);

    if (year == 0){
      rtimeFrame = semDif + 1;
    }
    else if(semDif == 0 && year !=0){
      semDif = 3;
      rtimeFrame = (semDif*year)+1;
    }
    else if(semDif != 0 && year !=0){
      rtimeFrame = (semDif +(year*3))+1;
    }
    print("time2" );
    print(rtimeFrame);

    for (int i = 0; i<rtimeFrame; i++){
      if(currSem == 'Spring'){
        setState(() {
          rpassingSemester = currSem;
          rpassingYear = currYear.toString();
        });
        getPerDeptPloData();


        currSem = 'Summer';
      }
      else if (currSem == 'Summer'){
        setState(() {
          rpassingSemester = currSem;
          rpassingYear = currYear.toString();
        });
        getPerDeptPloData();
        currSem = 'Autumn';
      }
      else if (currSem == 'Autumn'){
        setState(() {
          rpassingSemester = currSem;
          rpassingYear = currYear.toString();
        });
        getPerDeptPloData();

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


  @override
  void initState() {
    getAttemptedPloData();
    getAchievedPloData();
     getTimeFrame();
     getTimeFrame2();
     rgetTimeFrame();
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
                                  did = deptDropdownValue;
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
                        Row(
                          children: [
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      deptPloStdCount.clear();
                                      deptPloCount.clear();
                                    });
                                  },
                                  child: Text('clear')),
                            ),
                          ],
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
                        child: HaBarChart3.withSampleData()),
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
                              value: deptDropdownValue2,
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
                                  deptDropdownValue2 = newValue!;
                                  did2 = deptDropdownValue2;
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
                                  value: stSemesterDropdownValue2,
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
                                      stSemesterDropdownValue2 = newValue!;
                                      stSemester = stSemesterDropdownValue2;
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
                                  value: endSemesterDropdownValue2,
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
                                      endSemesterDropdownValue2 = newValue!;
                                      endSemester = endSemesterDropdownValue2;
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
                                  value: endYearDropdownValue2,
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
                                      endYearDropdownValue2 = newValue!;
                                      endYear = endYearDropdownValue2;
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
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    print("pressed");
                                    // getAchievedPloData();
                                    // getAttemptedPloData();
                                    getTimeFrame2();
                                    print("button");
                                    // print(deptPloCount);

                                  },
                                  child: Text('Submit')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      deptPloperStdCount.clear();
                                      deptPloperCount.clear();
                                    });
                                  },
                                  child: Text('clear')),
                            ),
                          ],
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
        Container(
          height: 500,
          width: 500,
          child: RadarChart.light(
              ticks: ticks,
              features: uniPloperCount.cast<String>(),
              data: [uniPloperStdCount]

          ),

        ),
      ],
    );
  }
}
