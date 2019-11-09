import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://lathanhhanh.tk/api/xekhach.php?fbclid=IwAR3ZbyEYQERIvBe0qoTbKQ_V4cDgReEr2dm3o3jwPAY1IrHF5c_YsO8WDKM";

class API {
  static Future getData() {
    var url = baseUrl;
    return http.get(url);
  }
}