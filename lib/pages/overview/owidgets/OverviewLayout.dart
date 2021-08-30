import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/pages/overview/owidgets/bar_chart.dart';
import 'package:plato_six/widgets/custom_text.dart';


class RevenueSectionLarge extends StatefulWidget {

  @override
  State<RevenueSectionLarge> createState() => _RevenueSectionLargeState();
}

class _RevenueSectionLargeState extends State<RevenueSectionLarge> {
  late TextEditingController _controller;
  String courseDropdownValue = 'CSE101';
  String semesterDropdownValue = 'Summer 21';

  @override
  void initState() {
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
                Row(
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
                    Padding(
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
                          });
                        },
                        items: <String>['Summer 21', 'Spring 21', 'Autumn 20', 'Summer 20']
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
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Student ID',
                      hintText: '1820243'
                    ),



                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){print("pressed");}, child: Text('Submit')),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}