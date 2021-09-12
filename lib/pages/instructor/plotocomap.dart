import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String cid = "CSE101";
String semester = "Summer";
String year = "2021";
String co = "CO1";
String plo = "1";
late String coThresh;

final instructorCotoPlo =
    'http://localhost/platoapi/Instructor/Inputs/InsCotoPlo.php';

TextEditingController CO = new TextEditingController();
TextEditingController COthresh = new TextEditingController();

//late TextEditingController _controller;
String courseDropdownValue = 'CSE101';
String semesterDropdownValue = 'Summer';
String yearDropdownValue = '2021';
//String coDropdownValue = 'CO1';
String ploDropdownValue = '1';

class plotocoPage extends StatefulWidget {
  @override
  State<plotocoPage> createState() => _plotocoPageState();
}

class _plotocoPageState extends State<plotocoPage> {
  // List<DynamicPloCo> listDynamic = [];
  // List<String> CO = [];
  // List<String> PLO = [];

  // addDynamic() {
  //   listDynamic.add(new DynamicPloCo());
  //   // if (CO.length != 0) {
  //   //   floatingicon = new Icon(Icons.add);

  //   //   CO = [];
  //   //   PLO = [];
  //   //   listDynamic = [];
  //   // }
  //   setState(() {});
  //   // if (listDynamic.length >= 10) {
  //   //   return;
  //   // }
  // }

  void postPlotoCoData() async {
    try {
      dynamic body = {
        "plo": "$plo",
        "cid": "$cid",
        "co": "$co",
        "coThresh": "$coThresh",
      };

      final response = await http.post(Uri.parse(instructorCotoPlo),
          body: json.encode(body),
          headers: {
            //'Content-Type': 'application/json; charset=UTF-8',
            "Access-Control-Allow-Origin": "*",
            'Content-type': 'application/json',
            'Accept': 'application/json',
            //"Authorization": "Some token",
            "Access-Control-Allow-Headers": "*"
          });

      if (response.statusCode == 200) {
        print("pr" + response.body);
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
    postPlotoCoData();

    CO = TextEditingController();
    COthresh = TextEditingController();
  }
  // Widget plotoCo() {
  //   return Container(
  //     child: Row(
  //       children: [
  //         Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //           Flexible(
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Container(
  //                 child: DropdownButton<String>(
  //                   //controller: PLO,
  //                   value: ploDropdownValue,
  //                   icon: const Icon(Icons.arrow_downward),
  //                   iconSize: 24,
  //                   elevation: 16,
  //                   style: const TextStyle(color: Colors.deepPurple),
  //                   underline: Container(
  //                     height: 2,
  //                     color: Colors.deepPurpleAccent,
  //                   ),
  //                   onChanged: (String? newValue) {
  //                     setState(() {
  //                       ploDropdownValue = newValue!;
  //                       plo = ploDropdownValue;
  //                     });
  //                   },
  //                   items: <String>[
  //                     'PLO1',
  //                     'PLO2',
  //                     'PLO3',
  //                     'PLO4',
  //                     'PLO5',
  //                     'PLO6',
  //                     'PLO7',
  //                     'PLO8',
  //                     'PLO9',
  //                     'PLO10',
  //                     'PLO11',
  //                     'PLO12',
  //                     'PLO13'
  //                   ].map<DropdownMenuItem<String>>((String value) {
  //                     return DropdownMenuItem<String>(
  //                       value: value,
  //                       child: Text(value),
  //                     );
  //                   }).toList(),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Flexible(
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: TextField(
  //                 controller: CO,
  //                 decoration: InputDecoration(
  //                   border: OutlineInputBorder(),
  //                   labelText: 'CO',
  //                   hintText: 'CO1',
  //                 ),
  //                 onChanged: (String value) {
  //                   co = "$value";
  //                 },
  //               ),
  //             ),
  //           )
  //         ]),
  //       ],
  //     ),
  //   );
  // }

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
      child: Expanded(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: 'Course ID',
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
                ),
                // Flexible(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Container(
                //       child: DropdownButton<String>(
                //         value: semesterDropdownValue,
                //         icon: const Icon(Icons.arrow_downward),
                //         iconSize: 24,
                //         elevation: 16,
                //         style: const TextStyle(color: Colors.deepPurple),
                //         underline: Container(
                //           height: 2,
                //           color: Colors.deepPurpleAccent,
                //         ),
                //         onChanged: (String? newValue) {
                //           setState(() {
                //             semesterDropdownValue = newValue!;
                //             semester = semesterDropdownValue;
                //           });
                //         },
                //         items: <String>['Summer', 'Spring', 'Autumn']
                //             .map<DropdownMenuItem<String>>((String value) {
                //           return DropdownMenuItem<String>(
                //             value: value,
                //             child: Text(value),
                //           );
                //         }).toList(),
                //       ),
                //     ),
                //   ),
                // ),
                // Flexible(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Container(
                //       child: DropdownButton<String>(
                //         value: yearDropdownValue,
                //         icon: const Icon(Icons.arrow_downward),
                //         iconSize: 24,
                //         elevation: 16,
                //         style: const TextStyle(color: Colors.deepPurple),
                //         underline: Container(
                //           height: 2,
                //           color: Colors.deepPurpleAccent,
                //         ),
                //         onChanged: (String? newValue) {
                //           setState(() {
                //             yearDropdownValue = newValue!;
                //             year = yearDropdownValue;
                //           });
                //         },
                //         items: <String>['2021', '2020', '2019']
                //             .map<DropdownMenuItem<String>>((String value) {
                //           return DropdownMenuItem<String>(
                //             value: value,
                //             child: Text(value),
                //           );
                //         }).toList(),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: 'PLO ID',
                    size: 12,
                    color: Colors.black,
                    weight: FontWeight.bold),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DropdownButton<String>(
                        //controller: PLO,
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
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10',
                          '11',
                          '12',
                          '13'
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
                    text: 'CO Number',
                    size: 12,
                    color: Colors.black,
                    weight: FontWeight.bold),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: CO,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CO',
                        hintText: 'CO1',
                      ),
                      onChanged: (String value) {
                        co = "$value";
                      },
                    ),
                  ),
                ),
                CustomText(
                    text: 'CO Threshold',
                    size: 12,
                    color: Colors.black,
                    weight: FontWeight.bold),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: COthresh,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CO Threshold',
                        hintText: '40',
                      ),
                      onChanged: (String value1) {
                        coThresh = "$value1";
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: ElevatedButton(
                //         onPressed: null, child: Text('Add Field'))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        postPlotoCoData();
                        CO.clear();
                        COthresh.clear();
                        print("Submitted");

                        print("Course");
                      },
                      child: Text('Submit')),
                )
              ],
            ),
          ],
        ),
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
