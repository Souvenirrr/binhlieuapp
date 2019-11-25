import 'package:binhlieu_app/src/model/taxi_model.dart';
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
  var url1 = "http://lathanhhanh.tk/api/taxi.php";
  Api api;
  TaxiModel taxiModel;
  List datas;

  @override
  void initState() {
    super.initState();

    _fetchData();
    _fetchData1();
  }

  _fetchData1() async {
    var res = await http.get(url1);
    var decodeJson = jsonDecode(res.body);
    taxiModel = TaxiModel.fromJson(decodeJson);
    print(taxiModel.toJson());
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
    final List<Widget> _children = [
      layout1(),
      layout2(),
      Text("Hello world"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Bình liêu app"),
        centerTitle: true,
      ),
     body: _children[_currentIndex],
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
  Widget layout1(){
    return Scaffold(
      body: api == null ? Center(
        child: CircularProgressIndicator(),
        ) : ListView.builder(
          itemCount: api.data.length,
          itemBuilder: (BuildContext context, int index){
            return ExpansionTile(
              leading: Icon(Icons.desktop_mac),
              title: Text(api.data[index].tuyenxe),
              children: <Widget>[
                Text("Biển số xe: " + api.data[index].biensoxe),
                Text("Giá vé: " + api.data[index].giave),
                Text("Số ghế: "+ api.data[index].soghexe),
                Text("Thời gian đi: " + api.data[index].thoigian1),
                Text("Thời gian đến: " + api.data[index].thoigian2),
                Text("Số điện thoại: " +api.data[index].sodienthoai),
              ],  
            );
          },
        ),
    );
  }

  Widget layout2() {
    return Scaffold(
      body: taxiModel == null ? Center(
        child: CircularProgressIndicator(),
        ) : ListView.builder(
          itemCount: taxiModel.data.length,
          itemBuilder: (BuildContext context, int index){
            return ExpansionTile(
              leading: Icon(Icons.desktop_mac),
              title: Text(taxiModel.data[index].tentaxi),
              children: <Widget>[
                Text("So dien thoai: " + taxiModel.data[index].sodienthoai),
              ],  
            );
          },
        ),
    );
  }
}
