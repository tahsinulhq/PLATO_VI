import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/widgets/custom_text.dart';

// List<dynamic> studentPlolist = [];
// List<dynamic> studentPloPerlist = [];

// List<dynamic> coursePlolist = [];
// List<dynamic> coursePloPerlist = [];

String cid = "CSE101";
String semester = "Summer";
String year = "2021";
String co = "CO1";
String plo = "PLO1";

late TextEditingController _controller;
String courseDropdownValue = 'CSE101';
String semesterDropdownValue = 'Summer';
String yearDropdownValue = '2021';
//String coDropdownValue = 'CO1';
String ploDropdownValue = 'PLO1';

class plotocoPage extends StatefulWidget {
  @override
  State<plotocoPage> createState() => _plotocoPageState();
}

class _plotocoPageState extends State<plotocoPage> {
  Widget ploCo() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Flexible(
        child: Padding(
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
                'PLO1',
                'PLO2',
                'PLO3',
                'PLO4',
                'PLO5',
                'PLO6',
                'PLO7',
                'PLO8',
                'PLO9',
                'PLO10',
                'PLO11',
                'PLO12',
                'PLO13'
              ].map<DropdownMenuItem<String>>((String value) {
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
          child: TextField(
              //controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CO',
                hintText: 'CO1',
              ),
              onChanged: (String value) {
                co = "$value";
              }),
        ),
      )
    ]);
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: DropdownButton<String>(
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
                    ),
                    Flexible(
                      child: Padding(
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
                            items: <String>['2021', '2020', '2019']
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
                ploCo(),
                ploCo(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        print("Submitted");
                        //print(plolist);
                        //getStudentPloData();
                        //getCoursePloData();
                        print("Course");
                        //print(coursePlolist);
                        //print(coursePloPerlist);
                        // print(semester);
                        // print(year);
                        // print(body);
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

  // ignore: todo
  // TODO: implement build
  //   return Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         CustomText(
  //           text: "PLO to CO Mapping:",
  //           size: 18,
  //           weight: FontWeight.bold,
  //           color: Colors.black87,
  //         ),
  //       ]);
  // }
}
