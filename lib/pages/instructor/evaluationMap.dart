import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/widgets/custom_text.dart';

String cid = "CSE101";
String semester = "Summer";
String year = "2021";
String co = "CO1";
String assessname = 'Quiz';
String qno = 'Q1';

TextEditingController section = new TextEditingController();
TextEditingController sId = new TextEditingController();
TextEditingController oMark = new TextEditingController();
//late TextEditingController _controller;
String courseDropdownValue = 'CSE101';
String semesterDropdownValue = 'Summer';
String yearDropdownValue = '2021';
String assessnameDropdownValue = 'Quiz';
String qnoDropdownValue = 'Q1';
String coDropdownValue = 'CO1';

class evaluationMapPage extends StatefulWidget {
  @override
  State<evaluationMapPage> createState() => _evaluationMapPageState();
}

class _evaluationMapPageState extends State<evaluationMapPage> {
  Widget evalMap() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomText(
          text: 'Assessment Name',
          size: 12,
          color: Colors.black,
          weight: FontWeight.bold),
      Flexible(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: DropdownButton<String>(
              value: assessnameDropdownValue,
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
                  assessnameDropdownValue = newValue!;
                  assessname = assessnameDropdownValue;
                });
              },
              items: <String>['Quiz', 'Midterm', 'Final', 'Project']
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
      CustomText(
          text: 'Obtained Mark',
          size: 12,
          color: Colors.black,
          weight: FontWeight.bold),
      Flexible(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: oMark,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Obtained Mark',
              hintText: '85',
            ),
            onChanged: (String value) {
              co = "$value";
            },
          ),
        ),
      ),

      // Flexible(child:
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: TextField(
      //       //controller: _controller,
      //       decoration: InputDecoration(
      //         border: OutlineInputBorder(),
      //         labelText: 'CO',
      //         hintText: 'CO1',
      //       ),
      //       onChanged: (String value) {
      //         co = "$value";
      //       }),
      // ),)
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: 'Student ID',
                        size: 12,
                        color: Colors.black,
                        weight: FontWeight.bold),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: sId,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Student ID',
                            hintText: '1821543',
                          ),
                          onChanged: (String value) {
                            co = "$value";
                          },
                        ),
                      ),
                    ),
                    CustomText(
                        text: 'Course',
                        size: 12,
                        color: Colors.black,
                        weight: FontWeight.bold),
                    Flexible(
                      child: Padding(
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
                            items: <String>[
                              'CSE101',
                              'CSE303',
                              'CSE425',
                              'CSE303L'
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
                    CustomText(
                        text: 'Section',
                        size: 12,
                        color: Colors.black,
                        weight: FontWeight.bold),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: section,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Section',
                            hintText: '1',
                          ),
                          onChanged: (String value) {
                            co = "$value";
                          },
                        ),
                      ),
                    ),
                    CustomText(
                        text: 'Semester',
                        size: 12,
                        color: Colors.black,
                        weight: FontWeight.bold),
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
                    CustomText(
                        text: 'Year',
                        size: 12,
                        color: Colors.black,
                        weight: FontWeight.bold),
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
                evalMap(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        section.clear();
                        sId.clear();
                        oMark.clear();
                        print("Submitted");

                        //print("Course");
                      },
                      child: Text('Submit')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
