/// Statuscode : 200
/// message : "SUCCESS"
/// data : [{"id":1,"nama_lengkap":"Galih","username":"glhsya","password":"wkwk","email":"Glhsya@gmil","alamat":"jl wkwk"}]

class ResponseLogin {
  ResponseLogin({
      this.statuscode, 
      this.message, 
      this.data,});

  ResponseLogin.fromJson(dynamic json) {
    statuscode = json['Statuscode'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? statuscode;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Statuscode'] = statuscode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// nama_lengkap : "Galih"
/// username : "glhsya"
/// password : "wkwk"
/// email : "Glhsya@gmil"
/// alamat : "jl wkwk"

class Data {
  Data({
      this.id, 
      this.namaLengkap, 
      this.username, 
      this.password, 
      this.email, 
      this.alamat,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    namaLengkap = json['nama_lengkap'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    alamat = json['alamat'];
  }
  int? id;
  String? namaLengkap;
  String? username;
  String? password;
  String? email;
  String? alamat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nama_lengkap'] = namaLengkap;
    map['username'] = username;
    map['password'] = password;
    map['email'] = email;
    map['alamat'] = alamat;
    return map;
  }

}