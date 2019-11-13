import 'package:flutter/material.dart';
import 'package:binhlieu_app/src/model/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  var url = "http://lathanhhanh.tk/api/xekhach.php";
  Api api;

  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  _fetchData() async {
    var res = await http.get(url);
    var decodeJson = jsonDecode(res.body);
    api = Api.fromJson(decodeJson);
    print(api.toJson());
  }

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bình liêu app"),
        centerTitle: true,
      ),
     
      body: api == null ? Center(
        child: CircularProgressIndicator(),
        ) : ListView.builder(
          itemCount: api.data.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(api.data.toString()),    
            );
          },
        ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        backgroundColor: Colors.lightBlueAccent,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),

          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.calendar_today),
            title: new Text('Taxi'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Infomation'),
          )
        ],
      ),
    );
  }
}
