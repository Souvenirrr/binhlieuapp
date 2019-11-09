import 'package:flutter/material.dart';
import 'package:binhlieu_app/src/model/api.dart';
import 'package:binhlieu_app/src/model/network.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var datas = new List<Data>();

  _getData() {
    API.getData().then((response) {
      setState(() {
         list = json.decode(response.body);
        datas = list.map((model) => Data.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bình liêu app"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context, index) {
          return ListTile(title: Text(datas[index].id),);
        })
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
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
