class TaxiModel {
  String status;
  String msg;
  List<Data> data;

  TaxiModel({this.status, this.msg, this.data});

  TaxiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String id;
  String tentaxi;
  String sodienthoai;

  Data({this.id, this.tentaxi, this.sodienthoai});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentaxi = json['tentaxi'];
    sodienthoai = json['sodienthoai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentaxi'] = this.tentaxi;
    data['sodienthoai'] = this.sodienthoai;
    return data;
  }
}
