class Api {
  String status;
  String msg;
  List<Data> data;

  Api({this.status, this.msg, this.data});

  Api.fromJson(Map<String, dynamic> json) {
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
  String tuyenxe;
  String biensoxe;
  String giave;
  String soghexe;
  String thoigian1;
  String thoigian2;
  String sodienthoai;
  String ghichu;

  Data(
      {this.id,
      this.tuyenxe,
      this.biensoxe,
      this.giave,
      this.soghexe,
      this.thoigian1,
      this.thoigian2,
      this.sodienthoai,
      this.ghichu});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tuyenxe = json['tuyenxe'];
    biensoxe = json['biensoxe'];
    giave = json['giave'];
    soghexe = json['soghexe'];
    thoigian1 = json['thoigian1'];
    thoigian2 = json['thoigian2'];
    sodienthoai = json['sodienthoai'];
    ghichu = json['ghichu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tuyenxe'] = this.tuyenxe;
    data['biensoxe'] = this.biensoxe;
    data['giave'] = this.giave;
    data['soghexe'] = this.soghexe;
    data['thoigian1'] = this.thoigian1;
    data['thoigian2'] = this.thoigian2;
    data['sodienthoai'] = this.sodienthoai;
    data['ghichu'] = this.ghichu;
    return data;
  }
}