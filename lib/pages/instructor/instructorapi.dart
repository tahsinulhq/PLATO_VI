import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InstructorApi extends StatefulWidget {
  InstructorApi({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _InstructorApiState createState() => _InstructorApiState();
}

class _InstructorApiState extends State<InstructorApi> {
  //int _counter = 0;
  var data = "no data";
  var dataList;

  final String url = 'http://localhost/platoapi/coursesapi.php';
  //https://10.0.2.2:8000/api/users
  //https://127.0.0.1:8000/api/users
  //https://jsonplaceholder.typicode.com/todos/1

  void getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-type": "application/json",
        "Access-Control-Allow-Headers": "*"
      });

      if (response.statusCode == 200) {
        final List cid = json.decode(response.body);
        print(cid[0]);
        setState(() {
          dataList = cid[0]['CourseID'];
        });
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
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$dataList',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
